<template>
  <div class="Login">
    <h1>Train ticket purchase query system</h1>
    <el-form
      class="loginform"
      ref="form"
      :rules="rules"
      :model="form"
      label-width="80px"
    >
      <h2>login</h2>
      <el-form-item label="userID" prop="userID">
        <el-input v-model="form.userID"></el-input>
      </el-form-item>
      <el-form-item label="userKey" prop="userKey">
        <el-input v-model="form.userKey" type="password"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">login</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { login } from "@/api";
export default {
  data() {
    return {
      form: {
        userID: "",
        userKey: "",
      },
      rules: {
        userID: [{ required: true, message: "enter userID", trigger: "blur" }],
        userKey: [
          { required: true, message: "enter userKey", trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    onSubmit() {
      console.log("submit!");
      login(this.form).then((data) => {
        console.log(data.data);
        if (data.data == false) {
          alert("log failed");
          location.reload();
        } else {
          var s = data.data.split("-");
          console.log(s[0]);
          var userI = {
            userID: s[1],
            passengerID: s[3],
            jurisdiction: s[5],
          };
          console.log(userI);
          sessionStorage.setItem("logUser", JSON.stringify(userI));
          if (userI.jurisdiction == 1) {
            this.$router.push("/userHome");
          } else if (userI.jurisdiction == 0) {
            this.$router.push("/adminHome");
          }
        }
      });
    },
  },
};
</script>

<style>
.Login {
  margin-top: 130px;
  width: 100%;
  text-align: center;
}
.Login .loginform {
  width: 30%;
  margin: auto;
}
</style>
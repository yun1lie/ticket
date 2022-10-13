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
      <el-form-item label="username" prop="username">
        <el-input v-model="form.username"></el-input>
      </el-form-item>
      <el-form-item label="password" prop="password">
        <el-input v-model="form.password"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="onSubmit">login</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      form: {
        username: "",
        password: "",
      },
      rules: {
        username: [
          { required: true, message: "enter username", trigger: "blur" },
        ],
        password: [
          { required: true, message: "enter password", trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    onSubmit() {
      console.log("submit!");
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
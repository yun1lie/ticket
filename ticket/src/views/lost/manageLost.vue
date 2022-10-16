<template>
  <div class="manageLost">
    <h3>add Lost</h3>
    <el-form
      :model="lostForm"
      :rules="rules"
      ref="lostForm"
      label-width="100px"
      class="demo-lostForm"
    >
      <el-form-item label="lostName" prop="lostName">
        <el-input v-model="lostForm.lostName"></el-input>
      </el-form-item>
      <el-form-item label="location" prop="location">
        <el-input v-model="lostForm.location"></el-input>
      </el-form-item>
      <el-form-item label="time" prop="time">
        <el-input v-model="lostForm.time"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('lostForm')"
          >submit</el-button
        >
        <el-button @click="resetForm('lostForm')">reset</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import { addLost } from "@/api";
export default {
  data() {
    return {
      lostForm: {
        lostName: "",
        location: "",
        time: "",
      },
      rules: {
        lostName: [
          { required: true, message: "please input lostName", trigger: "blur" },
        ],
        location: [
          { required: true, message: "please input location", trigger: "blur" },
        ],
        time: [
          { required: true, message: "please input time", trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    submitForm(formlostName) {
      this.$refs[formlostName].validate((valid) => {
        if (valid) {
          console.log(this.lostForm);
          addLost(this.lostForm).then((data) => {
            console.log(data.data);
            if (data.data == 1) {
              alert("add sucessful");
              location.reload();
            } else {
              alert("add failed");
            }
          });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formlostName) {
      this.$refs[formlostName].resetFields();
    },
  },
};
</script>

<style>
.demo-lostForm {
  width: 60%;
  margin: auto;
}
</style>
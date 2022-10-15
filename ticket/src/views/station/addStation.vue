<template>
  <div class="addStation">
    <el-form
      :model="addStationForm"
      :rules="rules"
      ref="addStationForm"
      label-width="100px"
      class="addStationForm"
    >
      <el-form-item label="stationName" prop="stationName">
        <el-input v-model="addStationForm.stationName"></el-input>
      </el-form-item>
      <el-form-item label="region" prop="region">
        <el-input v-model="addStationForm.region"></el-input>
      </el-form-item>
      <el-form-item label="city" prop="city">
        <el-input v-model="addStationForm.city"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('addStationForm')"
          >submit</el-button
        >
        <el-button @click="resetForm('addStationForm')">reset</el-button>
      </el-form-item></el-form
    >
  </div>
</template>

<script>
import { insertStation } from "@/api";
export default {
  data() {
    return {
      addStationForm: {
        stationName: "",
        region: "",
        city: "",
      },
      rules: {
        stationName: [
          {
            required: true,
            message: "please input stationName",
            trigger: "blur",
          },
        ],
        region: [
          { required: true, message: "please input region", trigger: "change" },
        ],
        city: [
          { required: true, message: "please input city", trigger: "change" },
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          insertStation(this.addStationForm).then((data) => {
            console.log(data.data);
            if (data.data == 1) {
              alert("add sucess");
              location.reload();
            } else {
              alert("add failed");
              location.reload();
            }
          });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
    resetForm(formName) {
      this.$refs[formName].resetFields();
    },
  },
};
</script>

<style>
</style>
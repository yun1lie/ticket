<template>
  <div class="updateStation">
    <h1>updateStation</h1>
    <p>Please enter the station information you want to modify</p>

    <el-form
      :model="updateStationForm"
      :rules="rules"
      ref="updateStationForm"
      label-width="100px"
      class="updateStationForm"
    >
      <el-form-item label="stationName" prop="stationName">
        <el-input v-model="updateStationForm.stationName"></el-input>
      </el-form-item>
      <el-form-item label="region" prop="region">
        <el-input v-model="updateStationForm.region"></el-input>
      </el-form-item>
      <el-form-item label="city" prop="city">
        <el-input v-model="updateStationForm.city"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('updateStationForm')"
          >submit</el-button
        >
        <el-button @click="resetForm('updateStationForm')">reset</el-button>
      </el-form-item></el-form
    >
  </div>
</template>

<script>
import { updateStation } from "@/api";
export default {
  data() {
    return {
      updateStationForm: {
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
          updateStation(this.updateStationForm).then((data) => {
            console.log(data.data);
            if (data.data == 1) {
              alert("update successed!");
              this.$router.push("/StationManagement");
            } else {
              alert("update failed");
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
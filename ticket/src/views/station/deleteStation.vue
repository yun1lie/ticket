<template>
  <div class="deleteStation">
    <h1>deleteStation</h1>
    Please enter the name of the station you want to delete
    <el-form
      :model="deleteStationForm"
      :rules="rules"
      ref="deleteStationForm"
      label-width="100px"
      class="deleteStationForm"
    >
      <el-form-item label="stationName:" prop="stationName">
        <el-input v-model="deleteStationForm.stationName"></el-input>
      </el-form-item>

      <el-form-item>
        <el-button type="primary" @click="submitForm('deleteStationForm')"
          >submit</el-button
        >
      </el-form-item></el-form
    >
  </div>
</template>

<script>
import { deleteStation } from "@/api";
export default {
  data() {
    return {
      deleteStationForm: {
        stationName: "",
      },
      rules: {
        stationName: [
          {
            required: true,
            message: "please input stationName",
            trigger: "blur",
          },
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          deleteStation(this.deleteStationForm).then((data) => {
            console.log(data.data);
            if (data.data == 1) {
              alert("delete successed!");
              location.reload();
            } else {
              alert("delete failed");
              location.reload();
            }
          });
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
  },
};
</script>

<style>
.deleteStationForm {
  margin-top: 30px;
  width: 40%;
}
</style>
<template>
  <div class="editTrain">
    <h3>Modify vehicle</h3>
    <el-form
      :model="ruleForm"
      :rules="rules"
      ref="ruleForm"
      label-width="100px"
      class="fo"
    >
      <el-form-item label="trainID">
        <el-input v-model="ruleForm.trainID" :readonly="true"></el-input>
      </el-form-item>
      <el-form-item label="trainType" prop="trainType">
        <el-input v-model="ruleForm.trainType"></el-input>
      </el-form-item>
      <el-form-item label="startStation" prop="startStation">
        <el-input v-model="ruleForm.startStation"></el-input> </el-form-item
      ><el-form-item label="arriveStation" prop="arriveStation">
        <el-input v-model="ruleForm.arriveStation"></el-input> </el-form-item
      ><el-form-item label="startTime" prop="startTime">
        <el-input v-model="ruleForm.startTime"></el-input> </el-form-item
      ><el-form-item label="arriveTime" prop="arriveTime">
        <el-input v-model="ruleForm.arriveTime"></el-input> </el-form-item
      ><el-form-item label="firstSeat" prop="firstSeat">
        <el-input v-model="ruleForm.firstSeat"></el-input> </el-form-item
      ><el-form-item label="secondSeat" prop="secondSeat">
        <el-input v-model="ruleForm.secondSeat"></el-input> </el-form-item
      ><el-form-item label="firstPrice" prop="firstPrice">
        <el-input v-model="ruleForm.firstPrice"></el-input> </el-form-item
      ><el-form-item label="secondPrice" prop="secondPrice">
        <el-input v-model="ruleForm.secondPrice"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitForm('ruleForm')"
          >submit</el-button
        >
      </el-form-item>
    </el-form>
  </div>
</template>
<script>
import { findOneTrain } from "@/api";
import { updateTrain } from "@/api";
export default {
  created() {
    var TrainID = {
      firstSeat: "",
      secondSeat: "",
      firstPrice: 0,
      secondPrice: 0,
      startTime: "",
      trainID: parseInt(this.$route.params.trainID),
      arriveStation: "",
      startStation: "",
      arriveTime: "",
      trainType: "0",
    };
    console.log(TrainID);

    findOneTrain(TrainID).then((data) => {
      console.log(data.data);
      this.ruleForm = data.data[0];
      console.log(this.ruleForm);
    });
  },
  data() {
    return {
      ruleForm: {
        trainID: this.$route.params.trainID,
      },
      rules: {
        trainType: [
          { required: true, message: "请输入活动名称", trigger: "blur" },
        ],
        startStation: [
          { required: true, message: "请输入活动名称", trigger: "blur" },
        ],
        arriveStation: [
          { required: true, message: "请输入活动名称", trigger: "blur" },
        ],
        startTime: [
          { required: true, message: "请输入活动名称", trigger: "blur" },
        ],
        arriveTime: [
          { required: true, message: "请输入活动名称", trigger: "blur" },
        ],
        firstSeat: [
          { required: true, message: "请输入活动名称", trigger: "blur" },
        ],
        secondSeat: [
          { required: true, message: "请输入活动名称", trigger: "blur" },
        ],
        firstPrice: [
          { required: true, message: "请输入活动名称", trigger: "blur" },
        ],
        secondPrice: [
          { required: true, message: "请输入活动名称", trigger: "blur" },
        ],
      },
    };
  },
  methods: {
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          updateTrain(this.ruleForm).then((data) => {
            console.log(data.data);
            if (data.data == 1) {
              alert("sucessed");
              location.reload();
            } else {
              alert("failed");
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
.editTrain .fo {
  width: 50%;
  margin: auto;
}
</style>
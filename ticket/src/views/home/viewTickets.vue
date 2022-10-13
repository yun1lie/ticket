<template>
  <div class="viewTickets">
    <el-table :data="tableData" style="width: 100%">
      <el-table-column prop="tpID" label="tpID" width="180"> </el-table-column>
      <el-table-column prop="passengerID" label="passengerID" width="180">
      </el-table-column>
      <el-table-column prop="ticketID" label="ticketID"> </el-table-column>
      <el-table-column prop="money" label="money"> </el-table-column
      ><el-table-column prop="trainId" label="trainId"> </el-table-column
      ><el-table-column prop="seat" label="seat"> </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { viewTickets } from "@/api";
export default {
  created() {
    var user = JSON.parse(sessionStorage.getItem("logUser"));
    console.log(user);
    viewTickets(user).then((data) => {
      console.log(data.data);
      this.tableData = data.data;
    });
  },
  data() {
    return {
      tableData: [
       
      ],
    };
  },
};
</script>

<style>
</style>
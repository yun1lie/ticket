<template>
  <div class="sm">
    <el-table :data="stationTable" style="width: 100%">
      <el-table-column prop="stationName" label="stationName" width="230">
      </el-table-column>
      <el-table-column prop="region" label="region" width="500">
      </el-table-column>
      <el-table-column prop="city" label="city"> </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { findAllStation } from "@/api";
export default {
  created() {
    findAllStation().then((data) => {
      console.log(data.data);
      this.stationTable = data.data;
    });
  },
  data() {
    return {
      stationTable: [],
    };
  },
};
</script>

<style>
</style>
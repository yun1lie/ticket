<template>
  <div class="viewLost">
    <el-table :data="tableData" style="width: 100%">
      <el-table-column prop="lostID" label="lostID" width="180">
      </el-table-column>
      <el-table-column prop="lostName" label="lostName" width="180">
      </el-table-column>
      <el-table-column prop="location" label="location"> </el-table-column>
      <el-table-column prop="time" label="time"> </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  data() {
    return {
      tableData: [],
    };
  },
};
</script>

<style>
</style>
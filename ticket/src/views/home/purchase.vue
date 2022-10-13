<template>
  <div class="purchase">
    <h3>Purchase tickets</h3>
    <el-table :data="tableData" style="width: 100%">
      <el-table-column prop="tpID" label="tpID" width="180"> </el-table-column>
      <el-table-column prop="passengerID" label="passengerID" width="180">
      </el-table-column>
      <el-table-column prop="ticketID" label="ticketID"> </el-table-column>
      <el-table-column prop="money" label="money"> </el-table-column
      ><el-table-column prop="trainId" label="trainId"> </el-table-column
      ><el-table-column prop="seat" label="seat"> </el-table-column>
      <el-table-column label="opertaion" width="360px">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)"
            >Buy a first-class car</el-button
          >
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)"
            >Buy a second-class car</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
export default {
  methods: {
    handleEdit(index, row) {
      console.log(index, row);
    },
    handleDelete(index, row) {
      console.log(index, row);
    },
  },
  data() {
    return {
      tableData: [
        {
          date: "2016-05-02",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1518 弄",
        },
        {
          date: "2016-05-04",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1517 弄",
        },
        {
          date: "2016-05-01",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1519 弄",
        },
        {
          date: "2016-05-03",
          name: "王小虎",
          address: "上海市普陀区金沙江路 1516 弄",
        },
      ],
    };
  },
};
</script>

<style>
</style>
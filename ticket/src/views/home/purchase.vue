<template>
  <div class="purchase">
    <h3>Purchase tickets</h3>
    <el-table :data="tableData" style="width: 100%">
      <el-table-column prop="trainID" label="trainID"> </el-table-column>
      <el-table-column prop="trainType" label="trainType" width=130px> </el-table-column>
      <el-table-column prop="startStation" label="startStation" width=130px>
      </el-table-column>
      <el-table-column prop="arriveStation" label="arriveStation"  width=130px>
      </el-table-column><el-table-column prop="startTime" label="startTime"  width=130px>
      </el-table-column>
      <el-table-column prop="arriveTime" label="arriveTime"  width=130px> </el-table-column
      ><el-table-column prop="firstSeat" label="firstSeat"  width=130px> </el-table-column
      ><el-table-column prop="secondSeat" label="secondSeat" width=130px> </el-table-column>
      <el-table-column prop="firstPrice" label="firstPrice" width=130px> </el-table-column
      ><el-table-column prop="secondPrice" label="secondPrice" width=130px>
      </el-table-column>
      <el-table-column label="opertaion" width="360px">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)"
            >Buy a first-class car</el-button
          >
          <el-button size="mini" @click="handleEdit2(scope.$index, scope.row)"
            >Buy a second-class car</el-button
          >
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
import { getTrain } from "@/api";
export default {
  created() {
    getTrain().then((data) => {
      console.log(data.data);
      this.tableData = data.data;
    });
  },
  methods: {
    handleEdit(index, row) {
      console.log(index, row);
    },
    handleEdit2(index, row) {
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
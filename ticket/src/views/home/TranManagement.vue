<template>
  <div class="tm">
    车次管理
    <el-table :data="tableData" style="width: 100%">
      <el-table-column prop="trainID" label="trainID"> </el-table-column>
      <el-table-column prop="trainType" label="trainType" width="130px">
      </el-table-column>
      <el-table-column prop="startStation" label="startStation" width="130px">
      </el-table-column>
      <el-table-column prop="arriveStation" label="arriveStation" width="130px">
      </el-table-column
      ><el-table-column prop="startTime" label="startTime" width="130px">
      </el-table-column>
      <el-table-column prop="arriveTime" label="arriveTime" width="130px">
      </el-table-column
      ><el-table-column prop="firstSeat" label="firstSeat" width="130px">
      </el-table-column
      ><el-table-column prop="secondSeat" label="secondSeat" width="130px">
      </el-table-column>
      <el-table-column prop="firstPrice" label="firstPrice" width="130px">
      </el-table-column
      ><el-table-column prop="secondPrice" label="secondPrice" width="130px">
      </el-table-column>
      <el-table-column label="operation" width="200px">
        <template slot-scope="scope">
          <el-button size="mini" @click="handleEdit(scope.$index, scope.row)"
            >edit</el-button
          >
          <el-button
            size="mini"
            type="danger"
            @click="handleDelete(scope.$index, scope.row)"
            >delete</el-button
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
      //   this.$router.push("/editTrain/${row.trainID}");
      this.$router.push({
        name: "editTrain",
        params: {
          trainID: row.trainID,
        },
      });
    },
    handleDelete(index, row) {
      console.log(index, row);
    //   this.$router.push({
    //     name: "deleteTrain",
    //     params: {
    //       trainID: row.trainID,
    //     },
    //   });
    },
  },
  data() {
    return {
      tableData: [],
    };
  },
};
</script>

<style>
</style>
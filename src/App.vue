<template>
  <div id="app">
    <img src="./assets/logo.png" />
    <div>
      <p>
        If Element is successfully added to this project, you'll see an
        <code v-text="'<el-button>'"></code>
        below
      </p>
      <el-button>jenkins-demo</el-button>
    </div>
    <div>
      所有用户：
      <p v-for="user in users" :key="user._id">
        <span>用户名：{{ user.username }} </span>
        <span>密码：{{ user.password }} </span>
        <span>年龄：{{ user.age }} </span>
        <span>描述：{{ user.description }} </span>
        <span>
          创建时间：{{ $day(user.createDate).format('YYYY-MM-DD HH:mm:ss') }}
        </span>
      </p>
    </div>
    <HelloWorld msg="Welcome to Your Vue.js App" />
  </div>
</template>

<script>
import HelloWorld from './components/HelloWorld.vue'
import axios from 'axios'

export default {
  name: 'app',
  data() {
    return {
      users: []
    }
  },
  components: {
    HelloWorld
  },
  async mounted() {
    const res = await axios('/api/find')
    this.users = res.data
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>

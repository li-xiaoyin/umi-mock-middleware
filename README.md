# umi-mock-middleware

## 项目介绍
​	umi-mock-middleware是从umi代码中单独摘取出了mock中间件相关的独立代码，使之可以在React之外的环境，比如Vue中使用。功能更独立，更专一，使用更方便。

​	如果想了解更多umijs的信息，请移步[umijs官网](https://umijs.org/)，同时感谢umi对开源事业的贡献。

## 安装

```
npm install umi-mock-middleware
```

## 使用

​	以Vue CLI3为例，首先注册中间件，修改vue.config.js，如果没有在项目根文件夹下新建一个，关键代码如下：

```javascript
const path = require("path");
const { createMockMiddleware } = require("umi-mock-middleware");

module.exports = {
  devServer: {
    before: app => {
      if (process.env.MOCK !== "none" && process.env.HTTP_MOCK !== "none") {
        app.use(createMockMiddleware());
      }
    }
  }
};
```

​	在项目根文件夹下创建 `.umirc.mock.js` ，示例代码如下：

```javascript
module.exports = {
  ...require("./mock/index"),
  // 这里可以引入任意的mock文件，位置也随意。
};
```

​	在项目根文件夹下创建mock文件夹，在其中创建index.js，位置和文件名无所谓，在 `.umirc.mock.js` 中引用即可。

```javascript
module.exports = {
  // 以HTTP动词和URL为Key，映射一个处理句柄。
  [`GET /index`](req, res) {
    // 返回你的mock数据。比如：
    res.json({
        success: true
    })
  }
};
```

​	到此你的mock数据已经可以访问了，当修改mock数据的时候，中间件会自动刷新，无需重启。
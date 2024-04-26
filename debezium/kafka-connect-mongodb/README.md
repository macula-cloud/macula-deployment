### 下载依赖项到lib目录
更新依赖版本：
```mvn versions:update-properties```
执行依赖下载
```mvn -f pom.xml dependency:copy-dependencies```
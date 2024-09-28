

### 0.创建答题文件夹



### 一.数据库创建

1.打开navicat

2.创建链接

3.创建数据库

4.创建数据表

5.录入记录

6.交卷前备份数据库表

### 二.环境搭建

#### 1.创建答题文件夹

#### 2.使用idea创建java工程

两次next,

选择答题文件夹的project文件夹

#### 3.为java工程添加web框架

转换成web工程:

在资源管理界面项目名上右击:选择add

勾上web application

点ok

出现web文件夹,web-inf文件夹,里面有web.xml

#### 4.在src下面新建各种包

- dao
- entity
- service
- servlet

#### 5.将素材复制的对应文件夹下面

- 把试题X文件夹下面的素材文件夹里面的所有内容复制,粘贴到web文件夹下
- 复制jar包:在web-inf下新建lib文件夹,放到这里
- 右击lib文件夹,选择add as libary,这些jar包才可以使用
- 配置文件c3p0-config.xml放到src下面
- 把数据源工具类复制到dao下面

#### 6.配置run

- 选择run
- 添加本地服务器
- 选择本地服务器对应tomcat文件夹
- 根据实际修改端口
- 设置自动打开的浏览器
- 最下面有个红色!,点击最有的fix
- 修改deployment的地址为/

### 三.功能实现

#### 1.添加servlet的引用

- file-->ps--->modules--->dependencies
- 点击+---->选择文件夹dir--->tomcat home--->lib
- 选择servlet-api.jar,点ok
- scope这一列中选择provided

#### 2.新建一个servlet

- 新建一个普通类
- extents HttpServlet
- 右击选择Generate,再选择重写
- 选择doget,dopost
- 删除super行
- 到web.xml中注册
- 规定地址栏中发来的请求格式?action="add" 
- 使用代码获取action的值
- 使用if判断增删改查
- 给jsp页面传值
- 重定向req.getRequestDispatcher("project_list.jsp").forward(req,resp);
- 注意在每一个请求处理前进行乱码处理

#### 3.实体类

#### 4.dao

#### 5.新建一个页面project_list.jsp

- 在web下面
- 去对应静态页面中复制html之间所有内容,粘贴覆盖
- 在需要循环的行添加<c:forEach>
- 在jsp页面头部添加c标签的jar引用
- 取servlet带来的变量,放到c标签的items属性中items="${list}"
- c标签的var属性中放每次循环从集合中取出的值变量
- 找到表格行中td对应值${p.project_id}



#### 总结:

- 页面中发起访问请求:请求地址是一个servlet的地址
- 请求到达servlet:提取请求参数action的值
- 根据值来决定增删改查
- 假如是查:在对应的代码中,使用service中的查询方法来获取数据到一个list集合中
- service的查询方法中调用dao中的查询方法
- 在servlet中,获得了查询回来的数据后,把他打入请求变量中req.setAttribute("list",projects);
- 在servlet中,更换请求地址,更换成接收查询回来的数据的jsp页面
- tomcat服务器会渲染这个jsp页面,替换页面中变量参数${list},返回给浏览器

### 四.截图


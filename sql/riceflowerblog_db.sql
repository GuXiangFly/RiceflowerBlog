/*
 Navicat Premium Data Transfer

 Source Server         : 我的腾讯云
 Source Server Type    : MySQL
 Source Server Version : 50527
 Source Host           : 115.159.31.63:3306
 Source Schema         : riceflowerblog_db

 Target Server Type    : MySQL
 Target Server Version : 50527
 File Encoding         : 65001

 Date: 04/11/2017 01:58:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_article
-- ----------------------------
DROP TABLE IF EXISTS `t_article`;
CREATE TABLE `t_article`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(70) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `summary` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '概要',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `category_ids` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别id,多个,用/分开',
  `tag_ids` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签id,多个,用,分开',
  `status` int(1) NOT NULL COMMENT '文章状态：0-草稿，1-博文',
  `write_time` datetime NULL DEFAULT NULL COMMENT '撰写时间',
  `pub_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `hits` int(10) NULL DEFAULT 0,
  `code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `article_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_article
-- ----------------------------
INSERT INTO `t_article` VALUES (1, '策略设计模式', '这个是策略设计模式', '---\ntitle: 策略设计模式\n---\n\n## 简介\n策略模式，又叫算法簇模式，就是定义了不同的算法族，并且之间可以互相替换，此模式让算法的变化独立于使用算法的客户。\n\n## 实现\n#### 策略设计模式由以下几个部分组成\n\n-  **封装类**：也叫上下文，对策略进行二次封装，目的是避免高层模块对策略的直接调用。\n-  **抽象策略**：通常情况下为一个接口，当各个实现类中存在着重复的逻辑时，则使用抽象类来封装这\n   部分公共的代码，此时，策略模式看上去更像是模版方法模式。\n-  **具体策略**：具体策略角色通常由一组封装了算法的类来担任，这些类之间可以根据需要自由替换。\n-  ---\n#### 假设有这样一个需求\n\n**商店购物**：\n\n- 青铜会员打九五折\n- 白银会员打九折\n- 白金会员打八折\n\n\n----------\n\n 1. **我们先写抽象策略**\n```java\npublic interface Strategy {\n	double getPrice(double standardPrice);\n}\n\n```\n\n 2.  **三种具体策略**\n\n\n```java\n/**\n * 青铜用户\n * @author guxiang\n * @date 2017-2-23 下午8:09:56\n */\npublic class BronzeMember implements Strategy {\n\n	public double getPrice(double standardPrice) {\n		System.out.println(\"九五折\");\n		return standardPrice*0.95;\n	}\n\n}\n```\n\n```java\n/**\n * 白银用户\n * @author guxiang\n * @date 2017-2-23 下午8:10:57\n */\npublic class SilverMember implements Strategy {\n\n	public double getPrice(double standardPrice) {\n		System.out.println(\"九折\");\n		return standardPrice*0.9;\n	}\n\n}\n```\n\n```java\n/**\n * 白金用户\n * @author guxiang\n * @date 2017-2-23 下午8:10:23\n */\npublic class PlatinoMember implements Strategy{\n\n	public double getPrice(double standardPrice) {\n		System.out.println(\"八折\");\n		return standardPrice*0.8;\n	}\n\n}\n```\n\n 3.  **封装类（上下文类）**\n\n```java\n/**\n * context负责具体与策略类的交互\n * 在spring中的依赖注入功能，可以通过配置文件，动态注入策略对象\n * @author guxiang\n * @date 2017-2-23 下午8:53:57\n */\npublic class Context {\n	private Strategy strategy;\n\n	//构造注入\n	public Context(Strategy strategy) {\n		super();\n		this.strategy = strategy;\n	}\n	//set方法注入\n	public void setStrategy(Strategy strategy) {\n		this.strategy = strategy;\n	}\n\n	public void getFinallyPrice( double standardPrice) {\n		System.out.println(\"报价是\"+strategy.getPrice(standardPrice));\n	}\n}\n```\n\n策略模式的本质其实就是 分离算法，选择实现\n\n- JAVASE中的GUI编程就中的布局管理器是最常用的策略模式，Flow布局，Border布局，Card布局\n- Spring框架中，Resource接口，实现的资源访问策略\n', '1', '', 1, '2017-05-29 19:02:32', '2017-05-29 21:24:22', 29, '073053229021917');
INSERT INTO `t_article` VALUES (2, '享元设计模式', '享元模式（Flyweight Pattern）主要用于减少创建对象的数量，以减少内存占用和提高性能。这种类型的设计模式属于结构型模式，它提供了减少对象数量从而改善应用所需的对象结构的方式。', '## 简介\n享元模式（Flyweight Pattern）主要用于减少创建对象的数量，以减少内存占用和提高性能。这种类型的设计模式属于结构型模式，它提供了减少对象数量从而改善应用所需的对象结构的方式。\n\n\n----------\n\n\n## 案例\n\n\n----------\n\n\n### 坦克大战设计\n**每个坦克都是一个对象**\n\n以下两种可以是共享的 那么我么可以称他们为：**内部状态**\n > 1. 型号\n >2. 颜色\n \n 另外一些则是不可共享的 我们称之为：**外部状态**\n >1. 坐标\n \n \n\n\n----------\n\n\n### 代码实现\n\n**享元设计模式一般包括以下的四块内容**\n\n#### - **FlyWeight 抽象享元类**\n > 这个通常是一个接口或者是一个抽象类，这个可以提供内部状态，设置外部状态。\n > 我这边为了简洁，只写一个内部状态。\n > \n > \n\n```java\n public interface TankFlyWeight {\n	void setColor(String color);\n	String getColor();\n	void display(Coordinate coordinate);\n}\n```\n\n\n----------\n#### - **ConcreteFlyWeight具体享元类**\n > 具体享元类主要是为内部状态，也就是 共有的状态 提供一个存储的地方\n```java\n    class ConcreateTank implements TankFlyWeight{\n	private String  model;\n	private String color;\n	public void setColor(String color) {\n		\n		this.color = color;\n	}\n\n	public ConcreateTank(String color) {\n		super();\n		this.color = color;\n	}\n\n	public void display(Coordinate coordinate) {\n		\n		System.out.println(\"坦克颜色:\"+color);\n		System.out.println(\"坦克位置:\"+coordinate.getX()+\"==\"+coordinate.getY());\n	}\n\n\n\n	public String getColor() {\n		// TODO Auto-generated method stub\n		return color;\n	}\n\n```\n   \n\n\n----------\n#### - **UnsharedConcreateFlyWeight 非共享享元类 **\n > 用于存储外部状态，也就是经常改变的状态\n\n```java\n\npublic class Coordinate {\n	private int x,y;\n\n	public Coordinate(int x, int y) {\n		super();\n		this.x = x;\n		this.y = y;\n	}\n\n	public int getX() {\n		return x;\n	}\n\n	public void setX(int x) {\n		this.x = x;\n	}\n\n	public int getY() {\n		return y;\n	}\n\n	public void setY(int y) {\n		this.y = y;\n	}\n	\n}\n\n```\n\n#### - **FlyWeightFactory 享元工厂类**\n > 创建并管理享元对象，一般是键值对的形式\n   \n\n```java\nimport java.util.HashMap;\nimport java.util.Map;\n\npublic class TankFlyWeightFactory {\n	private static Map<String, TankFlyWeight> map = new HashMap<String, TankFlyWeight>();\n	\n	public static TankFlyWeight getTank(String color) {\n			if (map.get(color)!=null) {\n				return map.get(color);\n			}\n			else {\n				TankFlyWeight tankFlyWeight = new ConcreateTank(color);\n				map.put(color, tankFlyWeight);\n				return  map.get(color);\n			}\n	}\n}\n\n```\n\n\n#### - **最后 定义一个客户类进行测试**\n > 创建一个客户类，通过享元工厂进行生产取出\n \n\n```java\npublic class Client {\n	public static void main(String[] args) {\n		TankFlyWeight tank1 = TankFlyWeightFactory.getTank(\"黄色\");\n		TankFlyWeight tank2 = TankFlyWeightFactory.getTank(\"黄色\");\n		\n		System.out.println(tank1);\n		System.out.println(tank2);\n		\n		tank1.display(new Coordinate(10, 12));\n		tank2.display(new Coordinate(13,15));\n	}\n}\n\n```\n\n```\n输出结果是 \n\ncom.guxiang.flyweight.ConcreateTank@5d888759\ncom.guxiang.flyweight.ConcreateTank@5d888759\n坦克颜色:黄色\n坦克位置:10==12\n坦克颜色:黄色\n坦克位置:13==15\n\n```\n我们可以看到，两个对象的 hashcode值是一样的，这证明它们其实是同一个对象，这样就避免了内存中存放过多的相似的对象，而导致内存不够用的情况下。\n\n\n----------\n### **UML图实现如下**\n![这里写图片描述](http://img.blog.csdn.net/20170216144123973?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlfX1N1bl8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\n### 例子\n\n 1. 享元模式在身边随处可见,最常用的要属  String类  string类中有一个常量池的概念，其内部也是一个享元设计模式实现的。\n 2.  常见的还有 线程池 ThreadLocal \n 3. 以及数据连接池  \n', '1', '', 1, '2017-05-29 21:20:01', '2017-05-29 21:20:01', 12, '100050129202117');
INSERT INTO `t_article` VALUES (3, '模板方法模式', '模板方法模式（Template Method Pattern）\n定义一个操作中算法的框架，而将一些步骤延迟到子类中。模板方法模式使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。\n采用工厂方法的模式，将这个节点的代码实现转给子类完成。\n处理步骤在父类中定义好了，具体的实现延迟到子类中给出定义。', '## 简介\n模板方法模式（Template Method Pattern）\n定义一个操作中算法的框架，而将一些步骤延迟到子类中。模板方法模式使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。\n采用工厂方法的模式，将这个节点的代码实现转给子类完成。\n**处理步骤在父类中定义好了，具体的实现延迟到子类中给出定义。**\n\n\n----------\n## 代码实现\n假设有这样一种情况\n我们去医院看病分为以下三个步骤，前一个步骤，和后一个步骤固定\n\n - 挂号\n - 门诊（不固定看哪个病）\n - 买药\n\n代码如下：\n\n\n----------\n\n\n**首先定义父类方法**\n\n```java\n/**\n * 模板方法中的父类 tabeNumber buyMedicine 的步骤固定  diagnosis的步骤不固定\n * @author guxiang\n * @date 2017-2-25 下午2:16:38\n */\npublic abstract class SeeDoctor {\n	public void takeNumber() {\n		System.out.println(\"挂号\");\n	}\n	\n	/**\n	 * 交给子类去实现\n	 */\n	public abstract void diagnosis();\n	\n	public void buyMedicine() {\n		System.out.println(\"买药\");\n	}\n	\n	public final void process() {\n		this.takeNumber();\n		\n		this.diagnosis();\n		\n		this.buyMedicine();\n	}\n}\n\n```\n\n\n----------\n\n\n**用一个客户类测试**\n\n```java\n/**\n * 客户类测试\n * @author guxiang\n * @date 2017-2-25 下午2:20:35\n */\npublic class Client {\n	public static void main(String[] args) {\n		SeeDoctor sd1 = new SeeDoctor() {\n			\n			@Override\n			public void diagnosis() {\n				System.out.println(\"诊断颈椎病\");\n			}\n		};\n		sd1.process();\n		\n		SeeDoctor sd2 = new SeeDoctor() {\n			\n			@Override\n			public void diagnosis() {\n				System.out.println(\"诊断腰椎病\");\n			}\n		};\n		sd2.process();\n		\n	}\n}\n\n```\n**方法回调（钩子方法）**\n\n\n----------\n\n\n模板方法模式充分的体现了**“好莱坞”原则，**\n**“不要给我们打电话，我们会给你打电话(don‘t call us, we‘ll call you)”。** IOC是Inversion of Control的简称，IOC的原理就是基于好莱坞原则，所有的组件都是被动的（Passive），所有的组件初始化和调用都由容器负责。（**spring中有很好的体现**）\n\n\n\n**子类不能调用父类，而是通过父类调用子类**\n\n\n----------\n\n\n## 常见的开发场景\n\n \n\n - 数据库访问的封装\n - Junit 的单元测试\n - Spring中的 JDBCTemplate，HibernateTemplate\n - hibernate中的模板程序\n\n', '1', '', 1, '2017-05-31 13:59:09', '2017-05-31 13:59:09', 16, '511050931591317');
INSERT INTO `t_article` VALUES (4, '极其简单的 使用IDEA 中 实现springboot 热部署 （spring boot devtools版）', 'Spring Boot是由Pivotal团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。', '## 添加配置pom.xml配置\n第一步：添加springboot的配置文件  \n\n首先我先贴出我的配置\n\n- 添加依赖包\n\n```xml\n<!-- spring boot devtools 依赖包. -->\n        <dependency>\n            <groupId>org.springframework.boot</groupId>\n            <artifactId>spring-boot-devtools</artifactId>\n            <optional>true</optional>\n            <scope>true</scope>\n        </dependency>\n```\n- 添加插件\n\n```\n<plugin>\n	<groupId>org.springframework.boot</groupId>\n	<artifactId>spring-boot-maven-plugin</artifactId>\n	<configuration>\n		<!-- 如果没有该项配置，devtools不会起作用，即应用不会restart -->\n		<fork>true</fork>\n	</configuration>\n</plugin>\n```\n\n\n----------\n\n\n具体配置文件应该防止的位置为\n\n\n----------\n\n\n![这里写图片描述](http://img.blog.csdn.net/20170517131416499?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlfX1N1bl8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\n\n\n----------\n\n\n需要import的同学记得import 。\n![这里写图片描述](http://img.blog.csdn.net/20170517131531976?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlfX1N1bl8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\n\n\n----------\n\n\n## 任意修改源代码 并且 Ctrl+F9 bulid\n但是在eclipse中  项目是会自动编译的  但是在IDEA 中 我们需要 按ctrl+F9 让它再编译一下\n\n\n----------\n\n\n## 原理介绍\n\n> spring-boot-devtools 是一个为开发者服务的一个模块，其中最重要的功能就是自动应用代码更改到最新的App上面去。原理是在发现代码有更改之后，重新启动应用，但是速度比手动停止后再启动还要更快，更快指的不是节省出来的手工操作的时间。\n>  \n其深层原理是：\n**使用了两个ClassLoader，一个Classloader加载那些不会改变的类（第三方Jar包），另一个ClassLoader加载会更改的类，称为  restart ClassLoader,这样在有代码更改的时候，原来的restart ClassLoader 被丢弃，重新创建一个restart ClassLoader，由于需要加载的类相比较少，所以实现了较快的重启时间（5秒以内）。**\n', '3', '', 1, '2017-05-31 14:04:17', '2017-05-31 14:04:17', 20, '636051731041417');
INSERT INTO `t_article` VALUES (5, 'JavaScript回调函数详解', 'JavaScript回调函数详解', '## 介绍 ##\n相信很多做后端的特别是java程序员写JavaScript都有点写不惯，其中重要原因之一就是搞不清楚回调函数。   \n什么是回调函数呢？  其实回调函数的基本思想就是\n\n> 通过把一个函数的指针，当做另外一个函数的参数，这个函数就叫回调函数。\n\n回调函数有三种实现方式，下面我来一一介绍：\n\n----------\n\n\n通过指针来调用\n--\n首先上例子：\n\n这是一段程序，用来比较两个数值的大小。\n\n\n```JavaScript\n<script type=\"text/javascript\">\n\n\n\n        function max(num1,num2) {\n            if(num1>num2){\n                return num1;\n            }\n            else {\n                return num2;\n            }\n        }\n\n        function  min(num1,num2) {\n            if(num1<num2){\n                return num1;\n            }\n            else {\n                return num2;\n            }\n        }\n\n\n        function math1(num1,num2) {\n            return min(num1,num2);\n        }\n        alert(alert(math1(10,20)));\n\n\n    </script>\n```\n这是我们后端程序最先想到的写法，但是JavaScript中能传入指针，这样的坏处就是太死板\n如果我们想改为比较 max 的，需要改动原来的方法的源代码来调用。\n但是javascript能使用指针调用。于是摇身一变就能变成这样。\n\n```JavaScript\n  <script type=\"text/javascript\">\n  /**\n         *\n         * @param num1\n         * @param num2\n         * @param fun   函数指针\n         * @returns {*}\n         */\n        function math2(num1,num2,fun) {\n            return fun(num1,num2);\n        }\n\n\n        function max(num1,num2) {\n            if(num1>num2){\n                return num1;\n            }\n            else {\n                return num2;\n            }\n        }\n\n        function  min(num1,num2) {\n            if(num1<num2){\n                return num1;\n            }\n            else {\n                return num2;\n            }\n        }\n		//比较最大的\n        alert(math2(10,20,max));\n		//比较较小的\n		alert(math2(10,20,min));\n\n        \n </script>\n```\n\n这就是通过函数指针来调用。\n通过把一个函数的指针，当做另外一个函数的参数，这个函数就叫回调函数\n\n----------\n## 通过匿名函数来调用 ##\n\n由于JavaScript中 函数可以这么定义\n\n```JavaScript\nvar  a1 = func(aa,bb,cc){\n   alert(\"aa+bb+cc\");\n}\n```\n我们。\n于是我们可以化简上面的写法\n\n```JavaScript\n  <script type=\"text/javascript\">\n    /**\n         *\n         * @param num1\n         * @param num2\n         * @param fun   函数指针\n         * @returns {*}\n         */\n        function math2(num1,num2,fun) {\n            return fun(num1,num2);\n        }\n\n       alert( math2(10,20,function (num1,num2) {\n           if(num1<num2){\n               return num1;\n           }\n           else {\n               return num2;\n           }\n       }))\n    </script>\n```\n\n类似于我们Java中的 模板设计模式， 里面就有钩子函数。\n\n```JavaScript\n  alert(\n           \n      (function math3(num1,num2,fun) {\n           return fun(num1,num2);\n       })(10,20,function (num1,num2) {\n           if(num1<num2){\n               return num1;\n           }\n           else {\n               return num2;\n        }\n        })\n       \n       )\n```\n\n----------\n\n\n## 定义和方法同时执行的方式 ##\n这种其实换汤不换药，是第二种的改进版\n\n我们完全可以想想成以下的\n```JavaScript\n	\n	var math=function math3(num1,num2,fun) {\n           return fun(num1,num2);\n       }\n\n\nalert(\n	math(10,20,function (num1,num2) {\n           if(num1<num2){\n               return num1;\n           }\n           else {\n               return num2;\n        }\n        })\n      )  \n```\n\n', '4', '', 1, '2017-05-31 15:00:34', '2017-05-31 15:00:34', 14, '698053431001517');
INSERT INTO `t_article` VALUES (6, 'Centos7与Centos6的区别', 'Centos7与Centos6的区别', '\n> > 为了纪念一下我从 centos6 转来 centos7的一脸懵逼的情况。。特地转来一篇 不错的博文，希望小伙伴们不要再像我当初一样的懵逼了\n> /(ㄒoㄒ)/~~ 来自：http://www.centoscn.com/CentOS/2014/1031/4035.html\n> \n装机\n--\n\n首先是装机时，以前的rhel一系的（包括centos，fedora）选包都可以全选的，但现在是只能单选一项了，有子选项重复的；当装到选择分区时，centos7推荐的分区是xfs，而不是之前的ext（2，3，4）一系了；装机其他大致一样。\n\n\n初次启动\n----\n\n装完机后，开机进系统的界面换了，乍一看以为是两个内核，原来有一个是rescue选择，而且按e后，会发现所有的grub.conf的信息全出来了，好不容易找到内核启动的地方，写了个 1（要进单用户模式），然后进了rescue模式。\n\n\n字符界面\n----\n\n进系统后，是图形界面，想进字符界面，结果找到/etc/inittab，发现几乎是个空文件，文件中提示想改runlevel的话，可以把/lib/systemd/system/runlevel*.target  软连到 /etc/systemd/system/default.target下（当然考过来，覆盖也行），试了一下还行，能改到字符界面runlevel3。\n\n\n配置网络和主机名\n--------\n\n然后，想配置网络，进/etc/sysconfig/network-script/一看，我靠，网卡改名了enp1s5，好有趣，配置完网络后改主机名， 到/etc/sysconfig/network去改名字，发现这个文件也是空的，按原6版本的去修改，重启后没效果，man了一下hostname， 发现7中改名要到/etc/hostname去改名字。\n\n\n本地yum源和挂载\n---------\n\n接着，想配置一个本地yum源，配上后要挂光盘，手动挂上了，然后直接echo“mount ......”到rc.local中，毕竟是启动执行脚本，重启之后竟然没挂上，进去rc.local中看了一下，7中竟然要手动的把chmod +x rc.local, 是的，要手动加执行权限，难道我之前装的6以前的系统中这个都要手动加执行权限，我不记得啊！！！！ 当然，加了权限后，开机后启动执行了rc.local的mount命令。\n\n\nLVM和xfs\n-------\n\n后来，想着装一个lvm玩玩，于是啊就分区，格式化（特意格式化为了xfs），pv，vg，lv一步一步，都没问题，然后想着放大，缩小，这时出问题了，执行resize2fs时，怎么一直报superblock什么的出错，这是怎么回事，然后man resize2fs一下，发现这命令只支持ext的文件系统，我艹，那我装系统是怎么是lvm的，这个问题我还没解决，应该有解决方法。\n\n\ndhcp和服务\n-------\n\n接着，想着装一个dhcp玩玩，惊奇的发现所有dhcp的包装上之后，不能service dhcpd start，然后发现/etc/init.d/中竟然没一个dhcp类似的东西，毕竟6之前有dhcpd,dhcpd6,dhcrelay的，然后发现 /sbin/dhcpd有启动文件，难道，难道，以后的服务想service启，都要手动自己编？错了，是在/usr/lib/systemd/system/dhcpd.service,还要修改好多，然后加权限，执行service 服务  restart/stop。。。。。。可以，但是指向了systemctl  restart/start/stop   服务.service\n\n\niptables\n--------\n\n又发现iptables这次也不是作为一个服务在/etc/init.d/下面了，/sbin下有；\n\n然后，然后，就没有然后了，或许，真的是或许，发现新东西，再在这个日志上更新吧，真的是或许。\n\n对了，我还发现/etc/sysctl.conf也空了，想做个路由转发都要到/proc/sys/net下', '5', '', 1, '2017-06-02 23:36:54', '2017-06-02 23:36:54', 19, '433065402362317');
INSERT INTO `t_article` VALUES (7, 'Spring中使用到的九种设计模式', 'Spring中使用到的九种设计模式', '\n转自：http://ylsun1113.iteye.com/blog/828542\n\n##我对设计模式的理解：\n\n应该说设计模式是我们在写代码时候的一种被承认的较好的模式，就像一种宗教信仰一样，大多数人承认的时候，你就要跟随，如果你想当一个社会存在的话。好的设计模式就像是给代码造了一个很好的骨架，在这个骨架里，你可以知道心在哪里，肺在哪里，因为大多数人都认识这样的骨架，就有了很好的传播性。这是从易读和易传播来感知设计模式的好处。当然设计模式本身更重要的是设计原则的一种实现，比如开闭原则，依赖倒置原则，这些是在代码的修改和扩展上说事。说到底就是人类和代码发生关系的四种场合：阅读，修改，增加，删除。让每一种场合都比较舒服的话，就需要用设计模式。 \n但是话说如果你是个毛毛虫，又怎么懂得人的骨骼呢，不了解人的骨骼结构，又怎么知道心肺在哪里呢。让一个不了解设计模式的人去读充斥了设计模式的代码，也是一头雾水，这也是设计模式带来的负面效果。简单有错吗？没有，那为什么？因为我要满足修改和增加的需要，于是我们给自己一个用设计模式的借口。但是如果不修改和增加呢，那不是多此一举。那你又怎么知道不会修改和增加？也许在用设计模式的时候，我们总在问自己这样一个问题，这个玩意以后变化大吗，有增加的可能吗？ \n设计模式其实会带来复杂性的，这是无可争议的，我想我们应该在复杂和简单做一下平衡吧。 \n\n###下面来简单列举spring中的设计模式： \n**1.简单工厂** \n又叫做静态工厂方法（StaticFactory Method）模式，但不属于23种GOF设计模式之一。 \n简单工厂模式的实质是由一个工厂类根据传入的参数，动态决定应该创建哪一个产品类。 \nspring中的BeanFactory就是简单工厂模式的体现，根据传入一个唯一的标识来获得bean对象，但是否是在传入参数后创建还是传入参数前创建这个要根据具体情况来定。 \n\n**2.工厂方法（Factory Method）** \n定义一个用于创建对象的接口，让子类决定实例化哪一个类。Factory Method使一个类的实例化延迟到其子类。 \nspring中的FactoryBean就是典型的工厂方法模式。如下图： \n \n\n**3.单例（Singleton）** \n保证一个类仅有一个实例，并提供一个访问它的全局访问点。 \nspring中的单例模式完成了后半句话，即提供了全局的访问点BeanFactory。但没有从构造器级别去控制单例，这是因为spring管理的是是任意的Java对象。 \n\n**4.适配器（Adapter）** \n将一个类的接口转换成客户希望的另外一个接口。Adapter模式使得原本由于接口不兼容而不能一起工作的那些类可以一起工作。 \nspring中在对于aop的处理中有Adapter模式的例子，见如下图： \n \n由于Advisor链需要的是MethodInterceptor对象，所以每一个Advisor中的Advice都要适配成对应的MethodInterceptor对象。 \n\n**5.包装器（Decorator）** \n动态地给一个对象添加一些额外的职责。就增加功能来说，Decorator模式相比生成子类更为灵活。 \n \nspring中用到的包装器模式在类名上有两种表现：一种是类名中含有Wrapper，另一种是类名中含有Decorator。基本上都是动态地给一个对象添加一些额外的职责。 \n\n**6.代理（Proxy）** \n为其他对象提供一种代理以控制对这个对象的访问。 \n从结构上来看和Decorator模式类似，但Proxy是控制，更像是一种对功能的限制，而Decorator是增加职责。 \n \nspring的Proxy模式在aop中有体现，比如JdkDynamicAopProxy和Cglib2AopProxy。 \n\n**7.观察者（Observer）** \n定义对象间的一种一对多的依赖关系，当一个对象的状态发生改变时，所有依赖于它的对象都得到通知并被自动更新。 \n \nspring中Observer模式常用的地方是listener的实现。如ApplicationListener。 \n\n**8.策略（Strategy）** \n定义一系列的算法，把它们一个个封装起来，并且使它们可相互替换。本模式使得算法可独立于使用它的客户而变化。 \nspring中在实例化对象的时候用到Strategy模式，见如下图： \n \n在SimpleInstantiationStrategy中有如下代码说明了策略模式的使用情况： \n \n\n**9.模板方法（Template Method）** \n定义一个操作中的算法的骨架，而将一些步骤延迟到子类中。Template Method使得子类可以不改变一个算法的结构即可重定义该算法的某些特定步骤。 \n \nTemplate Method模式一般是需要继承的。这里想要探讨另一种对Template Method的理解。spring中的JdbcTemplate，在用这个类时并不想去继承这个类，因为这个类的方法太多，但是我们还是想用到JdbcTemplate已有的稳定的、公用的数据库连接，那么我们怎么办呢？我们可以把变化的东西抽出来作为一个参数传入JdbcTemplate的方法中。但是变化的东西是一段代码，而且这段代码会用到JdbcTemplate中的变量。怎么办？那我们就用回调对象吧。在这个回调对象中定义一个操纵JdbcTemplate中变量的方法，我们去实现这个方法，就把变化的东西集中到这里了。然后我们再传入这个回调对象到JdbcTemplate，从而完成了调用。这可能是Template Method不需要继承的另一种实现方式吧。 \n\n\n----------\n\n\nJdbcTemplate中的execute方法 \n ![这里写图片描述](http://img.blog.csdn.net/20170223210638013?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlfX1N1bl8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)\n \n\n\n----------\n\n\nJdbcTemplate执行execute方法 \n\n\n![这里写图片描述](http://img.blog.csdn.net/20170223210704045?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvbXlfX1N1bl8=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)', '3', '', 1, '2017-06-03 14:14:11', '2017-06-03 14:14:11', 30, '932061103141417');

-- ----------------------------
-- Table structure for t_authors
-- ----------------------------
DROP TABLE IF EXISTS `t_authors`;
CREATE TABLE `t_authors`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `account` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账户密码',
  `pen_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '笔名',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '常用邮箱',
  `profile` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人介绍',
  `verification_code` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '验证码',
  `varif_code_deadline` datetime NULL DEFAULT NULL COMMENT '验证码截止时间',
  `security_question_id` int(10) NULL DEFAULT NULL COMMENT '密保问题id',
  `user_status` int(1) NULL DEFAULT NULL COMMENT '用户状态:0禁用，1启用',
  `other_info` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_authors
-- ----------------------------
INSERT INTO `t_authors` VALUES (1, 'test', '912B7BC95FB9E6885A4685746433F39A', 'guxiangfly', '964999133@qq.com', '##爱编程的小青年...', NULL, NULL, NULL, 1, NULL);

-- ----------------------------
-- Table structure for t_category
-- ----------------------------
DROP TABLE IF EXISTS `t_category`;
CREATE TABLE `t_category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `description` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `status` tinyint(1) NULL DEFAULT 0 COMMENT '展示状态',
  `code` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `category_code`(`code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_category
-- ----------------------------
INSERT INTO `t_category` VALUES (1, '这个是GOF设计模式', 'GOF设计模式', 1, 'java');
INSERT INTO `t_category` VALUES (3, 'Spring Boot是由Pivotal团队提供的全新框架，其设计目的是用来简化新Spring应用的初始搭建以及开发过程。该框架使用了特定的方式来进行配置，从而使开发人员不再需要定义样板化的配置。', 'SpringBoot', 1, 'springboot');
INSERT INTO `t_category` VALUES (4, 'JavaScript一种直译式脚本语言，是一种动态类型、弱类型、基于原型的语言，内置支持类型。它的解释器被称为JavaScript引擎，为浏览器的一部分，广泛用于客户端的脚本语言。', '前端JavaScript', 1, 'JavaScript');
INSERT INTO `t_category` VALUES (5, 'linux操作系统', 'linux系统', 1, 'linuxSystem');

-- ----------------------------
-- Table structure for t_friendlink
-- ----------------------------
DROP TABLE IF EXISTS `t_friendlink`;
CREATE TABLE `t_friendlink`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `website` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hits` int(10) NULL DEFAULT 0,
  `priority` int(2) NULL DEFAULT NULL,
  `web_author_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_author_email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `add_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_friendlink
-- ----------------------------
INSERT INTO `t_friendlink` VALUES (2, 'guxiangfly的博客', '这是一个精简的hexo博客', 'http://blog.guxiangfly.cn/', 13, 10, '顾翔', 'guxiangfly@gmail.com', '2017-05-29 21:17:44');

-- ----------------------------
-- Table structure for t_guest
-- ----------------------------
DROP TABLE IF EXISTS `t_guest`;
CREATE TABLE `t_guest`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通讯邮箱',
  `nickname` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '昵称',
  `personal_website` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人网址',
  `access_ip` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '访问IP',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_guest
-- ----------------------------
INSERT INTO `t_guest` VALUES (1, 'guxiangfly@gmail.com', 'guxiangfly2', 'blog.guxiangfly.cn', NULL);
INSERT INTO `t_guest` VALUES (2, '215432523@qq.com', 'guxiang', 'blog.guxiangfly.cn', NULL);

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NULL DEFAULT NULL COMMENT '父id',
  `content` varchar(600) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `user_type` int(1) NOT NULL COMMENT '留言作者类别（author作者，guest访客）',
  `author_id` int(10) NOT NULL COMMENT '作者id',
  `article_id` int(10) NOT NULL COMMENT '所属文章id',
  `pub_time` datetime NULL DEFAULT NULL COMMENT '发表时间',
  `block_id` int(10) NULL DEFAULT NULL COMMENT '所在文章的评论区域属于第几块',
  `support_count` int(10) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (1, 0, '<p>写的很好，相互学习。。</p>\n', 0, 1, 1, '2017-05-29 20:08:26', NULL, 0);
INSERT INTO `t_message` VALUES (2, 0, '<p>1213</p>\n', 0, 2, 7, '2017-06-23 11:34:28', NULL, 0);

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `introduction` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `article_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `down_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hits` int(10) NULL DEFAULT NULL,
  `pub_time` datetime NULL DEFAULT NULL,
  `status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_project
-- ----------------------------
INSERT INTO `t_project` VALUES (1, 'JavaCV_Demo', '这是一个JavaCv 的练习程序\n\n我在这个练习Demo 上实现了以下的功能\n\n色彩改变（change color）\n大小改变（change scale）\n图片镜像（mirror）', 'https://github.com/GuXiangFly/JavaCv-Demo', 'https://github.com/GuXiangFly/JavaCv-Demo', 21, '2017-06-03 00:36:29', 1);
INSERT INTO `t_project` VALUES (2, '纯jsp+servlet电商项目', '一个纯jsp+servlet电商项目', 'https://github.com/GuXiangFly/myestore', 'https://github.com/GuXiangFly/myestore', 0, '2017-06-03 00:38:11', 0);

-- ----------------------------
-- Table structure for t_recommend
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend`;
CREATE TABLE `t_recommend`  (
  `id` bigint(18) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `has_content` int(1) NULL DEFAULT 0 COMMENT '是否包含内容',
  `article_url` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章对应的url',
  `content_id` int(10) NULL DEFAULT NULL COMMENT '对应的内容id，前提为has_content为true，即1',
  `hits` int(10) NULL DEFAULT 0 COMMENT '点击量',
  `pub_time` datetime NULL DEFAULT NULL COMMENT '发布时间',
  `summary` varchar(300) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简要说明',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_security_question
-- ----------------------------
DROP TABLE IF EXISTS `t_security_question`;
CREATE TABLE `t_security_question`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_type` int(1) NOT NULL COMMENT '用户类别（管理员，作者）',
  `question01` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `answer01` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `question02` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer02` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `question03` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `answer03` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for t_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_tag`;
CREATE TABLE `t_tag`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

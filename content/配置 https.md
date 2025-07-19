# **一、LInux-非容器化Nginx配置https**

1、通过运维平台找到周边服务Nginx的所在服务器

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps1.jpg) 

2、进入nginx服务器，通过ps -ef|grep nginx查看nginx所在目录

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps2.jpg) 

3、进入到/opt/weaver/slb/conf.d目录，自带的weaver_ssl.conf文件就是配置https的文件

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps3.jpg) 

4、可通过此配置，修改所需的端口号和证书路径

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps4.jpg) 

5、也可以直接将客户的证书重命名为server.key和server.crt，直接替换/opt/weaver/slb/ssl_file中的文件

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps5.jpg) 

6、检测nginx配置是否正常

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps6.jpg) 

7、可以通过运维平台或./nginx -s reload 重启nginx

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps7.jpg) 

备注：此方式针对oa的nginx为应用网络的最外层，如果客户在nginx的外层中还存在负载均衡，https需要在客户的负载均衡上配置，转发oa的nginx上的http端口号！

# **二、Linux-容器化Nginx配置https**

1、通过运维平台找到周边服务Nginx的所在服务器

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps8.jpg) 

2、进入nginx服务器，通过find / -name nginx.conf查看nginx所在目录

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps9.jpg) 

3、进入到/opt/weaver/nginx/conf.d目录，自带的weaver_ssl.conf文件就是配置https的文件

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps10.jpg) 

4、可通过此配置，修改所需的端口号和证书路径

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps11.jpg) 

5、也可以直接将客户的证书重命名为server.key和server.crt，直接替换/opt/weaver/slb/ssl_file中的文件

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps12.jpg) 

6、检测nginx配置是否正常

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps13.jpg) 

当结果显示test is successful表示配置正常

7、可以通过运维平台或./nginx -s reload 重启nginx

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps14.jpg) 

# 三、**Windows-Nginx配置https**

1、找到nginx所在的目录

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps15.jpg) 

2、找到front.conf文件，里面为配置https的字段

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps16.jpg) 

3、找到front.conf中原配置证书的位置

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps17.jpg) 

4、将新证书放到nginx/ssl_file目录下

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps18.jpg) 

5、将原证书重命名为.bak，新证书替换成之前的证书名

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps19.jpg) 

6、检测证书替换是否正常

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps20.jpg) 

7、重启nginx生效（也可以通过运维平台重启）

![](file:////Users/zhangduo/Library/Containers/com.kingsoft.wpsoffice.mac/Data/tmp/wps-zhangduo/ksohtml//wps21.jpg)
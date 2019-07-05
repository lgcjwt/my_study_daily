tiger服务器，写入cc_operation_tracks表时报错：
```ruby
ActiveRecord::StatementInvalid: Mysql2::Error: Incorrect string value: '\xE9\x80\x9A\xE8\xAF\x9D...'
```

查看proj项目database.yml配置发现：
```ruby
encoding：utf8这个配置被#注释
```

显然是创建表的时候，默认charset有问题

show create table cc_operation_tracks;#查看建表语句
```sql
CREATE TABLE `cc_operation_tracks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_id` bigint(20) DEFAULT NULL,
  `call_id` varchar(191) DEFAULT NULL,
  `call_log_id` bigint(20) DEFAULT NULL,
  `name` varchar(191) DEFAULT NULL,
  `notify_timestamp` varchar(191) DEFAULT NULL,
  `agent_id` varchar(191) DEFAULT NULL,
  `agent_name` varchar(191) DEFAULT NULL,
  `agent_work_id` varchar(191) DEFAULT NULL,
  `remark` text,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `cc_operation_tracks_unit_search_index` (`company_id`,`call_log_id`,`call_id`),
  KEY `index_cc_operation_tracks_on_call_log_id` (`call_log_id`),
  KEY `index_cc_operation_tracks_on_call_id` (`call_id`)
) ENGINE=InnoDB AUTO_INCREMENT=535 DEFAULT CHARSET=latin1

DEFAULT CHARSET=latin1 这里，mysql在建表时如果没有指定charset则默认使用latin1
```

修改：
```sql
alter table cc_operation_tracks default charset utf8;
alter table cc_operation_tracks convert to charset utf8;
```

测试正常，问题解决
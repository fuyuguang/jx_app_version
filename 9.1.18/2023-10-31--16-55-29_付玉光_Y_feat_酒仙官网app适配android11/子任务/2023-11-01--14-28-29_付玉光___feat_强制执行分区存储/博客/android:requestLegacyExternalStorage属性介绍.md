[Android各版本的外部存储配置建议 - 简书](https://www.jianshu.com/p/555ff52aafed)







采用分区存储只能读写外部共享目录。
 采用非分区存储是可以读写外部存储任何目录的。
 注意：android10在分区存储模式下不能用文件路径读写外部共享文件，但在android11在分区存储下又可以用文件路径读写外部共享文件，所以如果您的项目存在通过文件路径来读写外部共享文件，要在配置文件中设置`android:requestLegacyExternalStorage="true"`来适配android10

# 1、运行在android 11上

### 当targetSdkVersion<=28：

结果 `Environment.isExternalStorageLegacy()` 为 true，采用的是非分区存储方法。

### 当targetSdkVersion=29：

###### 不设置`android:requestLegacyExternalStorage="true"`

a 应用从非分区存储更新，结果`Environment.isExternalStorageLegacy()`为 true，采用的是非分区存储方法。
 b 正常卸载安装  结果`Environment.isExternalStorageLegacy()`为 flase ，采用的是分区存储方法。

###### 设置`android:requestLegacyExternalStorage="true"`

结果`Environment.isExternalStorageLegacy()`为 true，采用的是非分区存储方法。

### 当targetSdkVersion=30：

###### 不设置`android:preserveLegacyExternalStorage="true"`

结果`Environment.isExternalStorageLegacy()`为 false，采用的是分区存储方法。

###### 设置`android:preserveLegacyExternalStorage="true"`

a、应用从非分区存储更新，结果`Environment.isExternalStorageLegacy()`为 true，采用的是非分区存储方法。
 b、应用正常卸载安装或者从分区存储更新，结果`Environment.isExternalStorageLegacy()`为 flase，采用的是分区存储方法。

# 2、运行在android 10上

### 当targetSdkVersion<=28：

结果`Environment.isExternalStorageLegacy()`为 true，采用的是非分区存储方法。

### 当targetSdkVersion>=29：

###### 不设置`android:requestLegacyExternalStorage="true"`

a 应用从非分区存储更新，结果`Environment.isExternalStorageLegacy()`为 true，采用的是非分区存储方法。
 b 正常卸载安装  结果`Environment.isExternalStorageLegacy()`为 flase ，采用的是分区存储方法。

###### 设置`android:requestLegacyExternalStorage="true"`

结果`Environment.isExternalStorageLegacy()`为 true，采用的是非分区存储方法。

# 3、运行在android 9及以下

采用的是非分区存储方法


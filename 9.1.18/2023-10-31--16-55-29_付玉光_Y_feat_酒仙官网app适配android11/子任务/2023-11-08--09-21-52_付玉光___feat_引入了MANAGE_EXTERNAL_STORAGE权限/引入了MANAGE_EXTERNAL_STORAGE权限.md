Android 11 引入了 `MANAGE_EXTERNAL_STORAGE` 权限，该权限提供对应用专属目录和 `MediaStore` 

> **之外文件的写入权限**。

如需详细了解此权限，以及为何大多数应用无需声明此权限即可实现其用例，请参阅有关如何[管理存储设备上所有文件](https://developer.android.com/training/data-storage/manage-all-files?hl=zh-cn)的指南。







## [对外部存储空间的访问和所需权限](https://developer.android.com/training/data-storage?hl=zh-cn#permissions)



Android 定义了以下与存储相关的权限：[`READ_EXTERNAL_STORAGE`](https://developer.android.com/reference/android/Manifest.permission?hl=zh-cn#READ_EXTERNAL_STORAGE)、[`WRITE_EXTERNAL_STORAGE`](https://developer.android.com/reference/android/Manifest.permission?hl=zh-cn#WRITE_EXTERNAL_STORAGE) 和 [`MANAGE_EXTERNAL_STORAGE`](https://developer.android.com/reference/android/Manifest.permission?hl=zh-cn#MANAGE_EXTERNAL_STORAGE)。

在较低版本的 Android 系统中，应用需要声明 `READ_EXTERNAL_STORAGE` 权限才能访问位于外部存储空间中[应用专属目录](https://developer.android.com/training/data-storage/app-specific?hl=zh-cn#external)之外的任何文件。此外，应用需要声明 `WRITE_EXTERNAL_STORAGE` 权限才能向应用专属目录以外的任何文件写入数据。



Android 系统的版本越新，就越依赖于文件的用途而不是位置来确定应用对特定文件的访问和写入能力。特别是，如果您的应用以 Android 11（API 级别 30）或更高版本为目标平台，`WRITE_EXTERNAL_STORAGE` 权限完全不会影响应用对存储的访问权限。这种基于用途的存储模型可增强用户隐私保护，因为应用只能访问其在设备文件系统中实际使用的区域。



> 上面这行的意思是：由于app可以使用 `getExternalFilesDir()` 或 `getExternalCacheDir()` 方法往外部存储空间中app专属目录中存放数据而不需要使用  WRITE_EXTERNAL_STORAGE 权限,






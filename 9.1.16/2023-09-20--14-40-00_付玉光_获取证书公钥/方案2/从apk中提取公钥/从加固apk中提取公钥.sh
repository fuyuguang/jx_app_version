#[解析APK中CERT.RSA文件，获取公钥证书](https://blog.csdn.net/qq_25657125/article/details/131065903)

#a1d10604329eea5f93ce75ab6bd428df70516cab72a947726e6de2fdf081cbfcbc15bdd1f31a9292a74d0ffbc191c6e746acfa66de3f728ffee940e789146934f2f5ad4743f939b64ae9e72610203d941782f968aff0145c2f8832c4bc901019ef9325f04d361f0d2bec6b9ab2c52b8e284931b5dd270f40e75f53d9fe6518b5e75f27c3318483a01747a30797e374215039399c2f47c792eb484b5cc6cfd90bc4895c7557cde65c608512c5b6ec2e0b3e92495fdbb828d2aa03054ce990ec23d6c55a5a9fc0e8e11b8a46e9f5935e5d41f9fbfd90094c0028d5d4d5c90e4b624568f4209adb6e5df88e7b844b60fc0c7efee1b63e85170ee3b1d59f095217df

#加固包路径
apklog="/Users/fuyuguang/jiuxian_studio/build/release_jiuxian_9.1.15_wap.apk"
#apklog="/Users/fuyuguang/jiuxian_studio/build/apk/jiuxian_9.2.0/jiuxian_9.2.0_jiuxianwebsite.apk"
#

rm -rf ./apk

unzip ${apklog} -d ./apk
pwd
mkdir -p ./META-INF
cp -f ./apk/META-INF/channel.txt ./META-INF/channel.txt
cp -f ./apk/META-INF/JIUXIAN_.RSA ./META-INF/JIUXIAN_.RSA
cp -f ./apk/META-INF/JIUXIAN_.SF ./META-INF/JIUXIAN_.SF
cp -f ./apk/META-INF/MANIFEST.MF ./META-INF/MANIFEST.MF



#将CERT.RSA 后缀名修改为p7b, 然后双击CERT.p7b---》点击逻辑存储名---》点击证书---》双击颁发给--》详细信息---》公钥
# 即可得到公钥信息（此处显示的是16进制）
mv ./META-INF/JIUXIAN_.RSA ./META-INF/JIUXIAN_.p7b
rm -rf ./apk
open ./META-INF/JIUXIAN_.p7b
rm -rf ./META-INF
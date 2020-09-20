# EastMoneySpider

东方财富、天天基金股票基金证券数据爬虫

### Usage:

`git clone https://github.com/minicloudsky/EastMoneySpider.git`

### 创建 python3 虚拟环境

```bash
pip install virtualenv
virtualenv venv
source venv/bin/activate
```

### 修改数据库,改为你自己的数据库


`vim eastmoneyspider/settings.py`

```python
DATABASES = {
    "default": {
        'ENGINE': 'django.db.backends.mysql',
        'HOST': 'your database host',
        'PORT': 3306,
        'USER': 'your database user',
        'PASSWORD': 'your database password',
        'NAME': 'your database name'
    }
}
````

### 安装依赖包

```bash
pip install -r requirements.txt
```

### 执行爬取基金

```bash
cd bin
chmod 777 *.sh
sh start_server.sh
```

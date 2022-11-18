import os

jar = os.listdir()
jar = str(jar)
jar = str(re.findall(r'grasscutter.*?.jar', jar)).replace(r"['", "").replace(r"']", "")

os.system(f"java -jar {jar}")

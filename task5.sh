rm -r input
mkdir input
cp data.txt input/data.txt

# create input directory on HDFS
hdfs dfs -rm -r output
hdfs dfs -rm -r input
hadoop fs -mkdir -p input
# put input files to HDFS
hdfs dfs -put ./input/* input

# run wordcount
export HADOOP_CLASSPATH=$JAVA_HOME/lib/tools.jar
hadoop com.sun.tools.javac.Main Max_temp.java
jar cf mt.jar Max_temp*.class
hadoop jar mt.jar Max_temp input output

echo -e "\ninput data.txt:"
hdfs dfs -cat input/data.txt

# print the output of wordcount
echo -e "\nwordcount output:"
hdfs dfs -cat output/part-r-00000

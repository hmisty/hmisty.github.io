# Storm Starter Minimum

Here introduces how to start develop on [storm](http://storm-project.net/) the real-time computation system, or stream data processing framework, with minimum effort.

- no need to setup storm client
- little prior dependency steps (only 2: jdk and lein tool)
- straightly start with creating project and coding
- minimal codes in 2 languages, clojure and java, showing how easy to program on storm

Let's begin!

## install lein

- Make sure you have a Java JDK version 6 or later.
- [Download the script](https://raw.github.com/technomancy/leiningen/stable/bin/lein).
- Place it on your $PATH. (~/bin is a good choice if it is on your path.)
- Set it to be executable. (chmod 755 ~/bin/lein)

## create project

``` bash
lein new storm-starter-minimum
cd storm-starter-minimum
```

## quick start with clojure

modify project.clj

```
(defproject storm-starter-minimum "0.1.0-SNAPSHOT"
  :source-paths ["src/clj"]
  :aot :all
  :dependencies []
  :profiles {:dev
             {:dependencies [[storm "0.8.2"]
                             [org.clojure/clojure "1.5.1"]]}})
```

create src/clj/wordcount.clj :

[Source of wordcount.clj](storm-starter-minimum/clj/wordcount.clj)

compile and run it locally in the shell:

``` bash
lein deps
lein compile

lein run -m wordcount
```

IT WORKS NOW!

create ~/.storm/storm.yaml pointing out where the nimbus is, if you have not yet:

``` ruby
nimbus.host: "127.0.0.1"
```

package a uberjar, and deploy it to the storm cluster:

``` bash
lein uberjar

java -cp target/storm-starter-minimum-0.1.0-SNAPSHOT-standalone.jar:$(lein classpath) wordcount "wordcount-clj"
```

browser http://127.0.0.1:8080

IT IS DEPLOYED AND RUNNING ON THE CLUSTER NOW!

## quick start with java

modify project.clj

```
(defproject storm-starter-minimum "0.1.0-SNAPSHOT"
  :source-paths ["src/clj"]
  :java-source-paths ["src/java"]
  :aot :all
  :dependencies []
  :profiles {:dev
             {:dependencies [[storm "0.8.2"]
                             [org.clojure/clojure "1.5.1"]]}})
```

create several java source files.

src/java/WordCountTopology.java :

[Source of WordCountTopology.java](storm-starter-minimum/java/WordCountTopology.java)

src/java/spout/RandomSentenceSpout.java :

[Source of RandomSentenceSpout.java](storm-starter-minimum/java/spout/RandomSentenceSpout.java)

src/java/bolt/SplitSentence.java :

[Source of SplitSentence.java](storm-starter-minimum/java/bolt/SplitSentence.java)

src/java/bolt/WordCount.java :

[Source of WordCount.java](storm-starter-minimum/java/bolt/WordCount.java)

compile and run it locally in the shell:

``` bash
lein clean
lein compile

java -cp $(lein classpath) WordCountTopology
```

IT WORKS NOW!


package a uberjar, and deploy it to the storm cluster:

``` bash
lein uberjar

java -cp target/storm-starter-minimum-0.1.0-SNAPSHOT-standalone.jar:$(lein classpath) WordCountTopology "wordcount-java"
```

browser http://127.0.0.1:8080

IT IS DEPLOYED AND RUNNING ON THE CLUSTER NOW!

## why we do not even need storm client

Thanks to 

```
(System/setProperty "storm.jar" (.. (Class/forName "wordcount") getProtectionDomain getCodeSource getLocation getPath))
```

and

``` java
System.setProperty("storm.jar", Class.forName("WordCountTopology").getProtectionDomain().getCodeSource().getLocation().getPath());
```

we can submit the topology without using storm client and will not get it complain like follows:

``` bash
Exception in thread "main" java.lang.RuntimeException: Must submit topologies using the 'storm' client script so that StormSubmitter knows which jar to upload.
 at backtype.storm.StormSubmitter.submitJar(StormSubmitter.java:130)
 at backtype.storm.StormSubmitter.submitJar(StormSubmitter.java:122)
 at backtype.storm.StormSubmitter.submitTopology(StormSubmitter.java:73)
 at backtype.storm.StormSubmitter.submitTopology(StormSubmitter.java:40)
 at WordCountTopology.main(WordCountTopology.java:39)
```

## all the codes

You can find out [all the codes on github.com](https://github.com/hmisty/storm-starter-minimum). 

## last but not least

Setting up a storm cluster is fairly easy. Here is [a clean tutorial in Chinese](http://blog.linezing.com/2013/01/how-to-install-and-deploy-storm-cluster?spm=0.0.0.0.L4IWks).

Enjoy your happy journey with storm and big data stream!

---

More reference readings:

  * [Storm tutorial](https://github.com/nathanmarz/storm/wiki/Tutorial)
  * [Storm concepts](https://github.com/nathanmarz/storm/wiki/Concepts)
  * [Setting up a storm cluster](https://github.com/nathanmarz/storm/wiki/Setting-up-a-Storm-cluster)
  * [Running topologies on a production cluster](https://github.com/nathanmarz/storm/wiki/Running-topologies-on-a-production-cluster)

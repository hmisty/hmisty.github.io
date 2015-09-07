# Support Vector Machine For Programmers

# Preface

*Mathematicians read formulas. Programmers read codes. Perl Monks read $#&^\_@!.*

Hence I decided to summarize a completely painless tutorial of SVM (Support Vector Machine) for programmers and let codes talk.

Even though I found out very good [lecture notes by Andrew Ng for CS229][1], comprehensive and wonderful [presentation by Alexander Statnikov et al][2], and someone's even similar idea [the machine learning for hackers][3] where chapter 12 is about SVM.

For whom wants to DIY or hack SVM.

Here we start.

## Prerequisite

In this tutorial, we will still need to do some math. But don't worry. High school math plus a little bit calculus and linear algebra would be just fine.

More importantly, I will use three different programming languages to show you the coding implementations which are R, scala and clojure. If you have not yet been familiar with the three fabulous tools, here are some nice resources for you to catch up:

* Learning R: [A (very) short intro to R][4] (pdf); [Try R at Code School][5] (online learning)
* learning python: [Learn Python the Hard Way][8] (free book); [python at codeacademy][9] (online learning)
* Learning clojure: [Clojure learning resources][8] (web page); [4clojure][9] (online learning)

## Outline

Here is a brief list of the topics to be covered by this tutorial.

1. Learn SVM in 1-minute
  * Classify female and male with 1-line code of SVM
1. Back to theory: math buster
  * Hilbert's axioms regarding straight line
  * Over-determined system
  * Linear regression
  * Linear Discriminant Analysis
  * Linear Classifier
  * Generative models vs Discriminative models
  * Support Vector Machine
1. SVC: primal form and solution
  * L2 norm
  * Quardratic programming
  * Convex optimization
  * Lagrangian multiplier
  * KKT condition
  * Soft margin and loss functions
1. SVC: dual form and solution
1. Kernel trick
1. SVR: Support Vector Regression
1. OCSVM: One-Class SVM
1. Online learning using SGD
1. Application example: stock price prediction
  * Time series and dynamical system theory
  * Phase space reconstruction and Takens\' therom 
1. TBD...

******

# Preface (Chinese)

*数学家读公式。程序员读代码。Perl程序员读$#&^\_@!。*

因此我决定总结一篇关于SVM（支持向量机）的指南。用代码讲述。

尽管我发现了[Andrew Ng的CS229课程的出色教案][1]、[Alexander Statnikov等内容丰富精彩的讲义][2]以及一本具有类似构思的书[《黑客的机器学习书》][3]————在书的第12章讲到了SVM。

为了那些想DIY或hack SVM的同学。

就此开始。

## 预备知识

在这篇指南中，我们仍然需要做一点点的数学演算。不过不用担心。高中数学加上一点微积分和线性代数知识就足够了。

更重要的，我会使用三种不同的编程语言来讲述算法的代码实现：R、scala和clojure。如果你尚不熟悉这三种极好的工具，这里是一些学习的资源：

* 学习R：[A (very) short intro to R][4] (pdf); [Try R at Code School][5] (online learning)
* 学习python：[Learn Python the Hard Way][8] (free book); [python at codeacademy][9] (online learning)
* 学习clojure：[Clojure learning resources][8] (web page); [4clojure][9] (online learning)


[1]: http://219.239.26.20/download/37689091/52516876/5/pdf/230/39/1361316241894_807/cs229-notes3.pdf
[2]: http://www.nyuinformatics.org/downloads/supplements/SVM_Tutorial_2010/Final_WB.pdf
[3]: http://www.clayford.net/statistics/machine-learning-for-hackers-chapter-12/
[4]: http://cran.r-project.org/doc/contrib/Torfs+Brauer-Short-R-Intro.pdf
[5]: http://tryr.codeschool.com
[6]: http://learnpythonthehardway.org/
[7]: http://www.codecademy.com/tracks/python
[8]: http://readwrite.com/2011/07/01/free-e-books-on-clojure
[9]: http://www.4clojure.com/


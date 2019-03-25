# Asciinema录制

## 零.实验环境：

- Ubuntu 18.04 Server
- Asciinema recorder

## 一.录制视频：

### Lesson1:
[![asciicast](https://asciinema.org/a/PNmp2534yqTTqW619n4TnZH8x.svg)](https://asciinema.org/a/PNmp2534yqTTqW619n4TnZH8x)

### Lesson2:

[![asciicast](https://asciinema.org/a/BaMMM0jQyfmaHsks1NDZpz9rU.svg)](https://asciinema.org/a/BaMMM0jQyfmaHsks1NDZpz9rU)

### Lesson3:

[![asciicast](https://asciinema.org/a/elzK2UTHggdq2bIDhIaD7OdLV.svg)](https://asciinema.org/a/elzK2UTHggdq2bIDhIaD7OdLV)

### Lesson4:

[![asciicast](https://asciinema.org/a/NyEnHS2ArvBdgZhEsrQDuYreC.svg)](https://asciinema.org/a/NyEnHS2ArvBdgZhEsrQDuYreC)

### Lesson5:

[![asciicast](https://asciinema.org/a/Xn9qiIlOdjASWF9ivWi17g8dQ.svg)](https://asciinema.org/a/Xn9qiIlOdjASWF9ivWi17g8dQ)

### Lesson6:

[![asciicast](https://asciinema.org/a/1t2szSKcPVIxDxyym0SJVzCvM.svg)](https://asciinema.org/a/1t2szSKcPVIxDxyym0SJVzCvM)

### Lesson7:

[![asciicast](https://asciinema.org/a/oULHgXIxrrRbOh5vOEMaNRb9F.svg)](https://asciinema.org/a/oULHgXIxrrRbOh5vOEMaNRb9F)

## 二.自查清单：

- **1.你了解vim有哪几种工作模式？**

  A：vim有四个模式：

  正常模式：Normal-mode

  插入模式：Insert-mode

  命令模式：Command-mode

  可视模式：Visual-`mode`

- **2.Normal模式下，从当前行开始，一次向下移动光标10行的操作方法？如何快速移动到文件开始行和结束行？如何快速跳转到文件中的第N行？**

  A:

  向下移动光标10行：`10j`

  移动到文件开始行：`gg`

  移动到文件结束行：`G`

  快速跳转到文件中的第N行：`[N+1]gg`

- **3.Normal`模式下`，如何删除单个字符、单个单词、从当前光标位置一直删除到行尾、单行、当前行开始向下数N行？**

  A:

  删除/剪切单个字符：`x`

  删除/剪切单个单词：`dw`

  删除至行尾：`d$`

  删除/剪切单行：`dd`

  删除N行：`Ndd`

- **4.如何在vim中快速插入N个空行？如何在vim中快速输入80个-？**

  A：

  快速插入N个空行：`No`

  输入80个-：`80i-`

- **5.如何撤销最近一次编辑操作？如何重做最近一次被撤销的操作？**

  A：

  撤销：`u`

  重做：`ctrl+r`

- **6.vim中如何实现剪切粘贴单个字符？单个单词？单行？如何实现相似的复制粘贴操作呢？**

  A：

  删除/剪切单个字符：`x`

  删除/剪切单个单词：`dw`

  删除/剪切单行：`dd`

  复制粘贴操作：`y`,`p`

- **7.为了编辑一段文本你能想到哪几种操作方式（按键序列）？**

  A：

  复制粘贴：`y`,`p`

  删除：`d`

  替换：`r`,`R`

  插入：`i`

  增加：`a`

- **8.查看当前正在编辑的文件名的方法？查看当前光标所在行的行号的方法？**

  A：`ctrl+g`显示当前正在编辑的文件名和光标所在行号。

- **9.在文件中进行关键词搜索你会哪些方法？如何设置忽略大小写的情况下进行匹配搜索？如何将匹配的搜索结果进行高亮显示？如何对匹配到的关键词进行批量替换？**

  A：`/keywords`来查找关键词，使用：`set ic`忽略大小写，`set hlsearch`将结果显示为高亮，批量替换关键词：`:%s/old/new/g`

- **10.在文件中最近编辑过的位置来回快速跳转的方法？**

  A：`ctrl+o`后跳转到上一个光标位置。

- **11.如何把光标定位到各种括号的匹配项？例如：找到(, [, or {对应匹配的),], or }**

  A：光标移动到某一括号，`%`后匹配相对应的括号。

- **12.在不退出vim的情况下执行一个外部程序的方法？**

  A：使用：`:! command`执行外部命令。

- **13.如何使用vim的内置帮助系统来查询一个内置默认快捷键的使用方法？如何在两个不同的分屏窗口中移动光标**

  A：使用在线查询：`:help [command]`

  ​      使用：`ctrl+w`来进行窗口切换。

## 三.参考资料：

vimtutor:<https://asciinema.org/docs/usage>

<http://sec.cuc.edu.cn/huangwei/course/LinuxSysAdmin/chap0x02.exp.md.html#/3>






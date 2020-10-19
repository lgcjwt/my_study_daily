

### 1.重写equals方法的要求：
  + 自反性：对于任何非空引用x，x.equals(x)应该返回true。
  + 对称性：对于任何引用x和y，如果x.equals(y)返回true，那么y.equals(x)也应该返回true。
  + 传递性：对于任何引用x、y和z，如果x.equals(y)返回true，y.equals(z)返回true，那么x.equals(z)也应该返回true。
  + 一致性：如果x和y引用的对象没有发生变化，那么反复调用x.equals(y)应该返回同样的结果。
  + 非空性：对于任意非空引用x，x.equals(null)应该返回false。

### 2.重写equals方法的时候为什么需要重写hashcode
  + 1.8种基本类型==比较的是值，类、接口、数组等，==比较的是内存地址
  + 2.HashMap、HashTable、HashSet的这种散列的数据类型的key会计算hashcode
  + 3.object类的equals方法，直接比较的内存地址

### 3.HashMap底层数据结构
  + 默认数组大小，16，也就是说，resize扩容两次后，如果有链表长度大于8，才会树化
  + 底层是链表数组，1.8之后引入红黑数
  + 链表长度大于指定值的时候成为红黑数（默认8）
  + 如果链表数组的长度小于64只会resize()(扩大两倍)
  + 哈希算法，hashcode与自身右移16位后异或的值：static final int hash(Object key) {int h;  return (key == null) ? 0 : (h = key.hashCode()) ^ (h >>> 16);}
  + 1.8中，初始化链表数组是在resize中，也是在resize中重新定义扩容的界限。

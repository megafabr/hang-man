# Игра hangman ("Виселица")
Основана на игре "Висилица" с двумя участниками (см. [описание](https://ru.wikipedia.org/wiki/Висилица_(игра))). Роль одного участника, который загадывает слово, выполняет программа, второй участник с консоли предлагает буквы чтобы угадать слово.

### Системные характеристики
Программа написана на языке Ruby

### Состав и запуск программы
1. Необходимо склонировать репозиторий с игрой
```
git clone git@github.com:megafabr/hangman.git
```
2. В состав программы входят:
* основная программа main.rb
* папка lib с программами двух классов Game и ConsoleInterface соответственно в файлах game.rb и console_interface.rb
* папка date, в которой находится текстовый файл words.txt (далее описан порядок заполнения этого файла), где размещаются загадываемые слова и папка figures, в которой размещены текстовые файлы изображений 01.txt - 07.txt со стадиями строящейся "виселицы"
* текстовый файл interface.txt с промежуточным состоянием консоли после запуска и нескольких ходов в игре (далее будет подробно описан весь интерфэйс игры в динамике)
```console
Слово: К О __ О __ __
          _______
          |/
          |     ( )
          |      |
          |
          |
          |
          |
          |
        __|________
        |         |

Ошибки (2): Х, У
У вас осталось ошибок: 5

Введите следующую букву:
```

3. Перейти в терминале в папку с файлами программы

4. Запустить в терминале с помощью интерпретатора 
```
$ ruby main.rb
```

### Описание игры, интерфэйс консоли и правила для ввода букв "И" и "Й" ("Е" и "Ё")
1. После запуска в консоле `$ ruby main.rb` программа:

* поприветствует вас
* выберет произвольным образом Слово, которое надо угадать, из файла words.txt
* выведет Слово, где вместо букв стоят двойные 
подчеркивания, в дальнейшем угаданные буквы будут выводиться в верхнем регистре
* начальное состояние "виселицы"
* количество, сделанных вами ошибок
* максимальное число возможных ошибок
* предложит ввести первую букву (можно вводить буквы в нижнем регистре; при вводе больше чем один символ, программа учитывает только первый; не буквенные символы игнорируются и вам потребуется ввести букву)
```console
$ ruby main.rb
Всем привет!
Слово: __ __ __ __ __ __
            _______
            |/
            |
            |
            |
            |
            |
            |
            |
          __|________
          |         |

Ошибки (0):
У вас осталось ошибок: 7

Введите следующую букву:
```

2. Если буква вами угадана неверно, программа:

* увеличит количество сделанных вами ошибок на 1
* покажет неугаданную букву в вехнем регисте (на примере латинская буква P)
* уменьшит на 1 количество оставшихся попыток
* достройка виселицы продвинется на 1 шаг
* предложит ввести следующую букву
```console
$ ruby main.rb
Слово: __ __ __ __ __ __
          _______
          |/
          |     ( )
          |
          |
          |
          |
          |
          |
        __|________
        |         |

Ошибки (1): P
У вас осталось ошибок: 6

Введите следующую букву:
```

3. Если вы угадали букву, то программа:
* вставит в угадываемое Слово угаданную букву (если такких букв в Слове несколько, то вставит их все)
* предложит ввести следующую букву 
```console
Слово: __ __ __ __ __ Т
          _______
          |/
          |     ( )
          |
          |
          |
          |
          |
          |
        __|________
        |         |

Ошибки (1): P
У вас осталось ошибок: 6

Введите следующую букву:
```

4. Игра заканчивается выйгрышем, если вы угадали все буквы, введя за время игры неправильные буквы меньше 7 раз. При этом программа выводит
* угаданное слово
* поздравления
* число сделанных за игру ошибок
* введенные буквы, которые не содержит загаданное Слово

```console
Слово: Й О Г У Р Т
          _______
          |/
          |     ( )
          |
          |
          |
          |
          |
          |
        __|________
        |         |

Ошибки (1): P
У вас осталось ошибок: 6

Поздравляем, вы выиграли!
```
5. Игра заканчивается проигрышем, если вы сделали 7 неудачных попыток угадать букву в загаданном Слове. Программа при этом выводит
* финальное состояние "виселицы"
* фразу "Вы проиграли, загаданное слово:" и само неугаданное Слово
```console
Слово: __ О Г У Р Т
          _______
          |/     |
          |     (_)
          |     _|_
          |    / | \\
          |      |
          |     / \\
          |    /   \\
          |
        __|________
        |         |

      * * *  RIP  * * *

Ошибки (7): P, К, Е, Н, А, П, Л
У вас осталось ошибок: 0

Вы проиграли, загаданное слово: ЙОГУРТ
```
6. По условиям игры программа считает одними и теми же буквы "И" и "Й". Если мы вводим "И" а в загаданном Слове имеется "Й" то программа засчитает ввод буквы "И" правильным и выведет в угаданном Слове букву "Й" (естественно, если в угадываемом Слове содержится буква "И", то выведет и её тоже). Далее приведены возможные случаи:
* ввели "И, в загаданное Слово ЙОГУРТ
* ввели "Й" в загаданное Слово ЁЖИК
* ввели "И" в загаданное Слово КИЙ
```console
Слово: Й __ __ __ __ __
            _______
            |/
            |
            |
            |
            |
            |
            |
            |
          __|________
          |         |

Ошибки (0):
У вас осталось ошибок: 7

Слово: __ __ И __
            _______
            |/
            |
            |
            |
            |
            |
            |
            |
          __|________
          |         |

Ошибки (0):
У вас осталось ошибок: 7

Слово: __ И Й
            _______
            |/
            |
            |
            |
            |
            |
            |
            |
          __|________
          |         |

Ошибки (0):
У вас осталось ошибок: 7
```
7. Аналогичное правило действует для пары букв "Е" и "Ё"

### Угадываемые слова
1. Список Слов для игры находится в файле data/words.txt
2. Каждое новое слово заносится с новой строке и записывается заглавными буквами
3. Слово должно быть именем существительным, нарицательным в именительном падеже единственного числа, либо множественного числа при отсутствии у слова формы единственного числа
### Разработка
1. Программа hangman была выполнена в качестве домашнего задания в курсе Ruby on Rails
2. Была поставлена задача вставить в уже готовую программу hangman возможность замены для пар букв ("И" и "Й") и ("Е" и "Ё")
3. Поставленная задача коснулась изменениями в классе Game:
* добавлен метод normalize_letter
```
def normalized_letters
    @letters.map{ |letter| normalize_letter(letter) }
  end
```
* добавлен метод normalize_letter с введением константы IDENTICALS
```
IDENTICALS = {
      "Й" => "И",
      "Ё" => "Е",
    }
def normalize_letter(letter)
    IDENTICALS[letter] || letter
  end
  ```
  * в метод play? добавлена обработка букв "Й" и "Ё" (две первые строчки)
  ```
  def letters_to_guess
    @letters.map do |letter|
      if @user_guesses.include?(normalize_letter(letter))
        letter
      else
        nil
      end
    end
  end
  ```


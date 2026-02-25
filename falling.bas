Rem Падающие буквы
' * *************************
' * Данная программа, написанная на языке программирования
' * FreeBASIC, представляет собой консольную демку в виде
' * падающих букв на экране предварительно введённой строки
' * имени пользователя.
' * Программа является кроссплатформенной.
' *
' * @author Ефремов А. В., 25.02.2026

Const ddelay As Double = 70: ' задержка (в мс)
Const maxRow As Long = 15: ' максимальное количество строк на экране

' * Пауза
' *
' * @param targetDelay Пауза (в мс)
' * @return Фактическая пауза (в мс)
Declare Function fDelay(targetDelay As Double = 0) As Double

Dim uName As String * 30, nuName As String
Dim letter As String * 1: ' переменная под одну букву
Dim delta As Double
Line Input "Your name"; uName: nuName = Trim(uName)
If uName = "" Then
  Print "You have not provided your name."
  Goto lQuit
End If

Cls: Dim l As Long = Locate(1, 1, 0): Print nuName;
l = Locate(maxRow + 1, 1, 0): Print String(Len(nuName), "=");
For col As Long = 1 To Len(nuName)
  letter = Mid(nuName, col, 1)
  For row As Long = 1 To maxRow
    If row > 1 Then
      l = Locate(row - 1, col, 0): Print Chr(32);
    End If
    l = Locate(row, col, 0): Print letter;
    delta = fDelay(ddelay)
  Next row
Next col
Print: Print: Print: l = Locate(, , 1)

lQuit:
End

Function fDelay(targetDelay As Double = 0) As Double
  Dim startTime As Double = Timer
  Dim delta As Double = 0
  While (delta <= targetDelay)
    delta = 1000 * (Timer - startTime)
  Wend
  Return delta
End Function

﻿
Процедура ДействияФормыЗаполнитьСвойствоГоловнойКонтрагент(Кнопка)

	СвойствоГоловнойКонтрагент = ПланыВидовХарактеристик.СвойстваОбъектов.НайтиПоНаименованию("Головной контрагент");
	Если СвойствоГоловнойКонтрагент.Пустая() Тогда
		Сообщить("Не найдено свойство Головной контрагент!");
		Возврат;
	КонецЕсли;
	
	СтандартнаяОбработка = Ложь;
	
	СхемаКомпоновкиДанных = ПолучитьМакет("ОсновнаяСхемаКомпоновкиДанных");
	НастройкиКомпоновки = КомпоновщикНастроек.ПолучитьНастройки();
	
	ДанныеРасшифровки = Новый ДанныеРасшифровкиКомпоновкиДанных;
	
	КомпоновщикМакета = Новый КомпоновщикМакетаКомпоновкиДанных;
	
	МакетКомпоновки = КомпоновщикМакета.Выполнить(СхемаКомпоновкиДанных, НастройкиКомпоновки,,, Тип("ГенераторМакетаКомпоновкиДанныхДляКоллекцииЗначений"));
	
	ПроцессорКомпоновкиДанных = Новый ПроцессорКомпоновкиДанных;
	ПроцессорКомпоновкиДанных.Инициализировать(МакетКомпоновки,, ДанныеРасшифровки);
				
	// Таблица значений, в которую будет получен результат
	Результат = Новый ДеревоЗначений;
	
	ПроцессорВывода = Новый ПроцессорВыводаРезультатаКомпоновкиДанныхВКоллекциюЗначений;
	ПроцессорВывода.УстановитьОбъект(Результат);
	ПроцессорВывода.Вывести(ПроцессорКомпоновкиДанных);
	
	
	Для каждого СтрокаДереваВидКонтрагента из Результат.Строки Цикл
		
		Для каждого СтрокаДереваГруппаДляХолдинга из СтрокаДереваВидКонтрагента.Строки Цикл
			
			Для каждого СтрокаДереваКонтрагент из СтрокаДереваГруппаДляХолдинга.Строки Цикл
				ОбработкаПрерыванияПользователя();
				Состояние(""+СтрокаДереваВидКонтрагента.ВидКонтрагента+" "+СтрокаДереваГруппаДляХолдинга.ГруппаДляХолдинга);
				
				Если ЗначениеЗаполнено(СтрокаДереваКонтрагент.НовыйГоловнойКонтрагент) Тогда
					Запись = РегистрыСведений.ЗначенияСвойствОбъектов.СоздатьМенеджерЗаписи();
					Запись.Объект = СтрокаДереваКонтрагент.НовыйГоловнойКонтрагент;
					Запись.Свойство = СвойствоГоловнойКонтрагент;
					Запись.Значение = Истина;
					Запись.Записать();
				КонецЕсли;
				
			КонецЦикла;
			
		КонецЦикла;
		
	КонецЦикла;
	
	
КонецПроцедуры


Процедура ДействияФормыОчиститьСвойство(Кнопка)
	
	СвойствоГоловнойКонтрагент = ПланыВидовХарактеристик.СвойстваОбъектов.НайтиПоНаименованию("Головной контрагент");
	Если СвойствоГоловнойКонтрагент.Пустая() Тогда
		Сообщить("Не найдено свойство Головной контрагент!");
		Возврат;
	КонецЕсли;
	
	Набор = РегистрыСведений.ЗначенияСвойствОбъектов.СоздатьНаборЗаписей();
	Набор.Отбор.Свойство.Установить(СвойствоГоловнойКонтрагент);
	Набор.Записать(Истина);
	
КонецПроцедуры


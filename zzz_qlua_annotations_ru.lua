--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.
--
-- https://github.com/Roffild/qlua-annotations
--

-- QUIK 11.0

-- Имена для @class и @alias взяты из английского раздела
-- "The tables used in the functions getItem, getNumberOf, and SearchItems".

--#region Структуры данных

---Формат даты и времени, используемый таблицах
---@class qluaDateTime
---@field mcs number Микросекунды
---@field ms number Миллисекунды
---@field sec number Секунды
---@field min number Минуты
---@field hour number Часы
---@field day number День
---@field week_day number Номер дня недели
---@field month number Месяц
---@field year number Год

---Позиции участника по деньгам
---@class qluaParticipantsCashPositions
---@field firmid string Идентификатор фирмы
---@field currcode string Код валюты
---@field tag string Код позиции
---@field description string Описание
---@field openbal number Входящий остаток
---@field currentpos number Текущий остаток
---@field plannedpos number Плановый остаток
---@field limit1 number Внешнее ограничение по деньгам
---@field limit2 number Внутреннее (собственное) ограничение по деньгам
---@field orderbuy number В заявках на продажу
---@field ordersell number В заявках на покупку
---@field netto number Нетто-позиция
---@field plannedbal number Плановая позиция
---@field debit number Дебет
---@field credit number Кредит
---@field bank_acc_id string Идентификатор счета
---@field margincall number Маржинальное требование на начало торгов
---@field settlebal number Плановая позиция после проведения расчетов

---@alias qlaccount_positions qluaParticipantsCashPositions

---Инструменты: Нога составного инструмента
---@class qluaInstrumentsLegN
---@field classcode string Параметр ноги, обозначающий код класса связанного инструмента
---@field seccode string Параметр ноги, обозначающий код связанного инструмента
---@field cfi string Параметр ноги, обозначающий CFI
---@field ratio_qty number Параметр ноги, обозначающий количество образования позиции при выполнении операции по связанному инструменту
---@field leg_side string Параметр ноги, обозначающий направление позиции при выполнении операции по связанному инструменту. Возможные значения: "buy" – покупка; "sell" – продажа
---@field settle_date number Параметр ноги, обозначающий дату расчетов

---Инструменты: Ноги составного инструмента
---@class qluaInstrumentsLegs
---@field leg_0 qluaInstrumentsLegN Нога составного инструмента
---@field leg_1 qluaInstrumentsLegN Нога составного инструмента
---@field leg_2 qluaInstrumentsLegN Нога составного инструмента
---@field leg_3 qluaInstrumentsLegN Нога составного инструмента
---@field leg_4 qluaInstrumentsLegN Нога составного инструмента
---@field leg_5 qluaInstrumentsLegN Нога составного инструмента
---@field leg_6 qluaInstrumentsLegN Нога составного инструмента
---@field leg_7 qluaInstrumentsLegN Нога составного инструмента
---@field leg_8 qluaInstrumentsLegN Нога составного инструмента
---@field leg_9 qluaInstrumentsLegN Нога составного инструмента

---Инструменты
---@class qluaInstruments
---@field code string Код инструмента
---@field name string Наименование инструмента
---@field short_name string Короткое наименование инструмента
---@field class_code string Код класса инструментов
---@field class_name string Наименование класса инструментов
---@field face_value number Номинал
---@field face_unit string Валюта номинала
---@field scale number Точность (количество значащих цифр после запятой)
---@field mat_date number Дата погашения
---@field lot_size number Размер лота
---@field isin_code string ISIN
---@field min_price_step number Минимальный шаг цены
---@field bsid string Bloomberg ID
---@field cusip_code string CUSIP
---@field stock_code string StockCode
---@field couponvalue number Размер купона
---@field first_currcode string Код котируемой валюты в паре
---@field second_currcode string Код базовой валюты в паре
---@field base_active_classcode string Код класса базового актива
---@field base_active_seccode string Базовый актив
---@field option_strike number Страйк опциона
---@field qty_multiplier number Кратность при вводе количества
---@field step_price_currency string Валюта шага цены
---@field sedol_code string SEDOL
---@field cfi_code string CFI
---@field ric_code string RIC
---@field buybackdate number Дата оферты
---@field buybackprice number Цена оферты
---@field list_level number Уровень листинга
---@field qty_scale number Точность количества
---@field yieldatprevwaprice number Доходность по предыдущей оценке
---@field regnumber string Регистрационный номер
---@field trade_currency string Валюта торгов
---@field second_curr_qty_scale number Точность количества котируемой валюты
---@field first_curr_qty_scale number Точность количества базовой валюты
---@field accruedint number Накопленный купонный доход
---@field stock_name string Код деривативного контракта в формате QUIK
---@field nextcoupon number Дата выплаты купона
---@field couponperiod number Длительность купона
---@field settlecode string Текущий код расчетов для инструмента
---@field exp_date number Дата экспирации
---@field settle_date number Дата расчетов
---@field legs qluaInstrumentsLegs Ноги составного инструмента в формате leg_<N>

---@alias qlsecurities qluaInstruments

---Заявки
---@class qluaOrders
---@field order_num number Номер заявки в торговой системе
---@field flags number Набор битовых флагов
---@field brokerref string Комментарий, обычно: <код клиента>/<номер поручения>
---@field userid string Идентификатор трейдера
---@field firmid string Идентификатор фирмы
---@field account string Торговый счет
---@field price number Цена
---@field qty number Количество в лотах
---@field balance number Остаток
---@field value number Объем в денежных средствах
---@field accruedint number Накопленный купонный доход
---@field yield number Доходность
---@field trans_id number Идентификатор транзакции
---@field client_code string Код клиента
---@field price2 number Цена выкупа
---@field settlecode string Код расчетов
---@field uid number Идентификатор пользователя
---@field canceled_uid number Идентификатор пользователя, снявшего заявку
---@field exchange_code string Код биржи в торговой системе
---@field activation_time number Время активации
---@field linkedorder number Номер заявки в торговой системе
---@field expiry number Дата окончания срока действия заявки
---@field sec_code string Код инструмента заявки
---@field class_code string Код класса заявки
---@field datetime qluaDateTime Дата и время
---@field withdraw_datetime qluaDateTime Дата и время снятия заявки
---@field bank_acc_id string Идентификатор расчетного счета/кода в клиринговой организации
---Способ указания объема заявки. Возможные значения: \
--- 0 – по количеству, \
--- 1 – по объему
---@field value_entry_type number
---@field repoterm number Срок РЕПО, в календарных днях
---@field repovalue number Сумма РЕПО на текущую дату. Отображается с точностью 2 знака
---@field repo2value number Объём сделки выкупа РЕПО. Отображается с точностью 2 знака
---@field repo_value_balance number Остаток суммы РЕПО за вычетом суммы привлеченных или предоставленных по сделке РЕПО денежных средств в неисполненной части заявки, по состоянию на текущую дату. Отображается с точностью 2 знака
---@field start_discount number Начальный дисконт, в %
---@field reject_reason string Причина отклонения заявки брокером
---@field ext_order_flags number Битовое поле для получения специфических параметров с западных площадок
---@field min_qty number Минимально допустимое количество, которое можно указать в заявке по данному инструменту. Если имеет значение "0", значит ограничение по количеству не задано
---Тип исполнения заявки. Возможные значения: \
--- 0 – Значение не указано; \
--- 1 – Немедленно или отклонить; \
--- 2 – Поставить в очередь; \
--- 3 – Снять остаток; \
--- 4 – До снятия; \
--- 5 – До даты; \
--- 6 – В течение сессии; \
--- 7 – Открытие; \
--- 8 – Закрытие; \
--- 9 – Кросс; \
--- 11 – До следующей сессии; \
--- 13 – До отключения; \
--- 15 – До времени; \
--- 16 – Следующий аукцион
---@field exec_type number
---@field side_qualifier number Поле для получения параметров по западным площадкам. Если имеет значение "0", значит значение не задано
---@field acnt_type number Поле для получения параметров по западным площадкам. Если имеет значение "0", значит значение не задано
---Роль в исполнении заявки. Возможные значения: \
--- 0 – не определено; \
--- 1 – Agent; \
--- 2 – Principal; \
--- 3 – Riskless principal; \
--- 4 – CFG give up; \
--- 5 – Cross as agent; \
--- 6 – Matched Principal; \
--- 7 – Proprietary; \
--- 8 – Individual; \
--- 9 – Agent for other member; \
--- 10 – Mixed; \
--- 11 – Market maker
---@field capacity number
---@field passive_only_order number Поле для получения параметров по западным площадкам. Если имеет значение "0", значит значение не задано
---@field visible number Видимое количество. Параметр айсберг-заявок, для обычных заявок выводится значение: "0"
---@field awg_price number Средняя цена исполнения. Актуально, когда заявка выполнилась частями
---@field expiry_time number Время окончания срока действия заявки в формате <ЧЧММСС DESIGNTIMESP=19552>. Для GTT-заявок, используется вместе со сроком истечения заявки (Expiry)
---@field revision_number number Номер ревизии заявки. Используется, если заявка была заменена с сохранением номера
---@field price_currency string Валюта заявки
---Расширенный статус заявки. Возможные значения: \
--- 0 (по умолчанию) – не определено; \
--- 1 – заявка активна; \
--- 2 – заявка частично исполнена; \
--- 3 – заявка исполнена; \
--- 4 – заявка отменена; \
--- 5 – заявка заменена; \
--- 6 – заявка в состоянии отмены; \
--- 7 – заявка отвергнута; \
--- 8 – приостановлено исполнение заявки; \
--- 9 – заявка в состоянии регистрации; \
--- 10 – заявка снята по времени действия; \
--- 11 – заявка в состоянии замены
---@field ext_order_status number
---@field accepted_uid number UID пользователя-менеджера, подтвердившего заявку при работе в режиме с подтверждениями
---@field filled_value number Исполненный объем заявки в валюте цены для частично или полностью исполненных заявок
---@field extref string Внешняя ссылка, используется для обратной связи с внешними системами
---@field settle_currency string Валюта расчетов по заявке
---@field on_behalf_of_uid number UID пользователя, от имени которого выставлена заявка
---Квалификатор клиента, от имени которого выставлена заявка. Возможные значения: \
--- 0 – не определено; \
--- 1 – Natural Person; \
--- 3 – Legal Entity
---@field client_qualifier number
---@field client_short_code number Краткий идентификатор клиента, от имени которого выставлена заявка
---Квалификатор принявшего решение о выставлении заявки. Возможные значения: \
--- 0 – не определено; \
--- 1 – Natural Person; \
--- 2 – Algorithm
---@field investment_decision_maker_qualifier number
---@field investment_decision_maker_short_code number Краткий идентификатор принявшего решение о выставлении заявки
---Квалификатор трейдера, исполнившего заявку. Возможные значения: \
--- 0 – не определено; \
--- 1 – Natural Person; \
--- 2 – Algorithm
---@field executing_trader_qualifier number
---@field executing_trader_short_code number Краткий идентификатор трейдера, исполнившего заявку
---@field settle_date number Дата расчетов. Для свопов дата расчетов первой части операции своп
---@field settle_date2 number Дата расчетов второй части операции своп
---@field start_date number Дата, начиная с которой допускается совершение валютирования. Заполняется только для контрактов типа "FLEX FORWARD" (см. параметр `operation_type`)
---Тип совершаемой операции. Возможные значения: \
--- -1 – NOT_DEFINED; \
--- 0 – SPOT; \
--- 1 – FORWARD; \
--- 2 – SWAP; \
--- 6 – NDF; \
--- 7 – FLEX FORWARD
---@field operation_type number
---@field qty2 number Количество второй части операции своп
---@field value2 number Объем второй части операции своп
---@field visibility_factor number Видимая часть в общей сумме заявки в %
---@field visible_repo_value number Сумма РЕПО видимой части (точность валюты расчетов заявки/инструмента)
---Идентификатор торговой сессии. Возможные значения: \
--- 0 – Не определено; \
--- 1 – Основная сессия; \
--- 2 – Дополнительная сессия; \
--- 3 – Итоги дня
---@field trading_session number
---Тип ввода значения цены заявки. Возможные значения: \
--- 1 – По цене; \
--- 2 – По доходности; \
--- 3 - По средневзвешенной цене
---@field price_entry_type number
---@field lseccode string Код инструмента, являющийся приоритетным обеспечением
---@field benchmark string Идентификатор индикативной ставки
---@field external_qty number Внешнее количество

---@alias qlorders qluaOrders

---Заявки на внебиржевые сделки
---@class qluaOrdersNegotiatedDeal
---@field neg_deal_num number Номер
---@field neg_deal_time number Время выставления заявки
---@field flags number Набор битовых флагов
---@field brokerref string Комментарий, обычно: <код клиента>/<номер поручения>
---@field userid string Трейдер
---@field firmid string Идентификатор дилера
---@field cpuserid string Трейдер партнера
---@field cpfirmid string Код фирмы партнера
---@field account string Счет
---@field price number Цена
---@field qty number Количество
---@field matchref string Ссылка
---@field settlecode string Код расчетов
---@field yield number Доходность
---@field accruedint number Купонный процент
---@field value number Объем
---@field price2 number Цена выкупа
---@field reporate number Ставка РЕПО (%)
---@field refundrate number Ставка возмещения (%)
---@field trans_id number ID транзакции
---@field client_code string Код клиента
---Тип ввода заявки РЕПО. Возможные значения: \
--- 0 – Не определен; \
--- 1 – Цена1 + Ставка; \
--- 2 – Ставка + Цена2; \
--- 3 – Цена1 + Цена2; \
--- 4 – Сумма РЕПО + Количество; \
--- 5 – Сумма РЕПО + Дисконт; \
--- 6 – Количество + Дисконт; \
--- 7 – Сумма РЕПО; \
--- 8 – Количество
---@field repoentry number
---@field repovalue number Сумма РЕПО
---@field repo2value number Объем выкупа РЕПО
---@field repoterm number Срок РЕПО
---@field start_discount number Начальный дисконт (%)
---@field lower_discount number Нижний дисконт (%)
---@field upper_discount number Верхний дисконт (%)
---@field block_securities number Блокировка обеспечения ("Да"/"Нет")
---@field uid number Идентификатор пользователя
---@field withdraw_time number Время снятия заявки
---@field neg_deal_date number Дата выставления заявки
---@field balance number Остаток
---@field origin_repovalue number Сумма РЕПО первоначальная
---@field origin_qty number Количество первоначальное
---@field origin_discount number Процент дисконта первоначальный
---@field neg_deal_activation_date number Дата активации заявки
---@field neg_deal_activation_time number Время активации заявки
---@field quoteno number Встречная безадресная заявка
---@field settle_currency string Валюта расчетов
---@field sec_code string Код инструмента
---@field class_code string Код класса
---@field bank_acc_id string Идентификатор расчетного счета/кода в клиринговой организации
---@field withdraw_date number Дата снятия адресной заявки в формате "ГГГГММДД"
---@field linkedorder number Номер предыдущей заявки. Отображается с точностью "0"
---@field activation_date_time qluaDateTime Дата и время активации заявки
---@field withdraw_date_time qluaDateTime Дата и время снятия заявки
---@field date_time qluaDateTime Дата и время заявки
---@field lseccode string Приоритетное обеспечение
---@field canceled_uid number UID снявшего заявку
---@field system_ref string Системная ссылка
---@field price_currency string Валюта, в которой указана цена заявки
---@field order_exchange_code string Биржевой номер заявки
---@field extref string Внешняя ссылка, используется для обратной связи с внешними системами
---@field period number Период торговой сессии, в которую была подана заявка
---Квалификатор клиента, от имени которого выставлена заявка. Возможные значения: \
--- 0 – не определено; \
--- 1 – Natural Person; \
--- 3 – Legal Entity
---@field client_qualifier number
---@field client_short_code number Краткий идентификатор клиента, от имени которого выставлена заявка
---Квалификатор принявшего решение о выставлении заявки. Возможные значения: \
--- 0 – не определено; \
--- 1 – Natural Person; \
--- 2 – Algorithm
---@field investment_decision_maker_qualifier number
---@field investment_decision_maker_short_code number Краткий идентификатор принявшего решение о выставлении заявки
---Квалификатор трейдера, исполнившего заявку. Возможные значения: \
--- 0 – не определено; \
--- 1 – Natural Person; \
--- 2 – Algorithm
---@field executing_trader_qualifier number
---@field executing_trader_short_code number Краткий идентификатор трейдера, исполнившего заявку
---@field settle_date number Дата расчетов. Для свопов дата расчетов первой части операции своп
---@field benchmark string Идентификатор индикативной ставки
---Набор битовых флагов. Возможные значения: \
--- бит 0 (0x1) – Валюты на адресной заявке заполнены в соответствии с общими правилами заполнения валют; \
--- бит 1 (0x2) – Признак заявки типа РЕПО с открытой датой
---@field ext_negdeal_flags number
---@field open_repo2date number День Т+1 для сделок РЕПО с Открытой датой
---@field open_repo2value number Стоимость выкупа РЕПО с открытой датой в день T+1
---@field reject_reason string Причина отклонения

---@alias qlneg_deals qluaOrdersNegotiatedDeal

---Классы
---@class qluaClasses
---@field firmid string Идентификатор фирмы
---@field name string Название класса
---@field code string Код класса
---@field npars number Количество параметров в классе
---@field nsecs number Количество инструментов в классе

---@alias qlclasses qluaClasses

---Позиции по инструментам
---@class qluaPositionsInInstruments
---@field sec_code string Код инструмента
---@field trdaccid string Счет депо
---@field firmid string Идентификатор фирмы
---@field client_code string Код клиента
---@field openbal number Входящий остаток
---@field openlimit number Входящий лимит
---@field currentbal number Текущий остаток
---@field currentlimit number Текущий лимит
---@field locked_sell number В продаже. Количество инструментов, заблокированное под исполнение заявок клиента на продажу
---@field locked_buy number В покупке. Количество инструментов в активных заявках клиента на покупку
---@field locked_buy_value number Стоимость инструментов, заблокированных под покупку
---@field locked_sell_value number Стоимость инструментов, заблокированных под продажу
---@field wa_position_price number Цена приобретения
---@field wa_price_currency string Валюта, в которой отображается значение цены приобретения инструмента. Для облигаций, цена которых выражена в процентах от номинала, возвращается значение "%". Параметр может принимать значение <пусто designtimesp=24022>, если в момент запроса данных в терминале отсутствует информация для расчета валюты цены приобретения
---Срок расчётов. Возможные значения: \
--- - положительные целые числа, начиная с 0, соответствующие срокам расчётов из таблицы Позиции по инструментам: 0 – T0, 1 – T1, 2 – T2 и т.д.; \
--- - отрицательные целые числа – технологические лимиты (используются для внутренней работы системы QUIK)
---@field limit_kind number

---@alias qldepo_limits qluaPositionsInInstruments

---Позиции по деньгам
---@class qluaCashPositions
---@field currcode string Код валюты
---@field tag string Код позиции
---@field firmid string Идентификатор фирмы
---@field client_code string Код клиента
---@field openbal number Входящий остаток
---@field openlimit number Входящий лимит
---@field currentbal number Текущий остаток
---@field currentlimit number Текущий лимит
---@field locked number Заблокировано. Сумма средств, заблокированных под исполнение заявок клиента
---@field locked_value_coef number Стоимость активов в заявках на покупку немаржинальных инструментов
---@field locked_margin_value number Стоимость активов в заявках на покупку маржинальных инструментов
---@field leverage number Плечо
---Срок расчётов. Возможные значения: \
--- - положительные целые числа, начиная с 0, соответствующие срокам расчётов из таблицы Позиции по деньгам: 0 – T0, 1 – T1, 2 – T2 и т.д.; \
--- - отрицательные целые числа – технологические лимиты (используются для внутренней работы системы QUIK)
---@field limit_kind number
---@field wa_position_price number Средневзвешенная цена приобретения позиции
---@field orders_collateral number Гарантийное обеспечение заявок
---@field positions_collateral number Гарантийное обеспечение позиций

---@alias qlmoney_limits qluaCashPositions

---Ограничения по клиентским счетам
---@class qluaClientAccountLimits
---@field firmid string Идентификатор фирмы
---@field trdaccid string Торговый счет
---Тип лимита. Возможные значения: \
--- 0 – Денежные средства; \
--- 1 – Залоговые денежные средства; \
--- 2 – По совокупным средствам; \
--- 3 – Клиринговые денежные средства; \
--- 4 – Клиринговые залоговые денежные средства; \
--- 5 – Лимит открытых позиций на спот-рынке; \
--- 6 – Суммарные залоговые средства в иностранной валюте (в рублях); \
--- 7 – Залоговые средства в иностранной валюте
---@field limit_type number
---@field liquidity_coef number Коэффициент ликвидности
---@field cbp_prev_limit number Предыдущий лимит открытых позиций на спот-рынке"
---@field cbplimit number Лимит открытых позиций
---@field cbplused number Текущие чистые позиции
---@field cbplplanned number Плановые чистые позиции
---@field varmargin number Вариационная маржа
---@field accruedint number Накопленный доход
---@field cbplused_for_orders number Текущие чистые позиции (под заявки)
---@field cbplused_for_positions number Текущие чистые позиции (под открытые позиции)
---@field options_premium number Премия по опционам
---@field ts_comission number Биржевые сборы
---@field kgo number Коэффициент клиентского гарантийного обеспечения
---@field currcode string Валюта, в которой транслируется ограничение
---@field real_varmargin number Реально начисленная в ходе клиринга вариационная маржа. Отображается с точностью до 2 двух знаков. При этом в поле "varmargin" транслируется вариационная маржа, рассчитанная с учетом установленных границ изменения цены

---@alias qlfutures_client_limits qluaClientAccountLimits

---Обезличенные сделки
---@class qluaAnonymizedDeals
---@field trade_num number Номер сделки в торговой системе
---@field flags number Набор битовых флагов
---@field price number Цена
---@field qty number Количество бумаг в последней сделке в лотах
---@field value number Объем в денежных средствах
---@field accruedint number Накопленный купонный доход
---@field yield number Доходность
---@field settlecode string Код расчетов
---@field reporate number Ставка РЕПО (%)
---@field repovalue number Сумма РЕПО
---@field repo2value number Объем выкупа РЕПО
---@field repoterm number Срок РЕПО в днях
---@field sec_code string Код бумаги заявки
---@field class_code string Код класса
---@field datetime qluaDateTime Дата и время
---Период торговой сессии. Возможные значения: \
--- 0 – Открытие; \
--- 1 – Нормальный; \
--- 2 – Закрытие
---@field period number
---@field open_interest number Открытый интерес
---@field exchange_code string Код биржи в торговой системе
---@field exec_market string Площадка исполнения
---@field benchmark string Идентификатор индикативной ставки

---@alias qlall_trades qluaAnonymizedDeals

---Обязательства и требования по активам
---@class qluaAssetCommitmentsAndClaims
---@field firmid string Идентификатор фирмы
---@field depo_account string Номер счета депо в Депозитарии (НДЦ)
---@field account string Торговый счет
---@field bank_acc_id string Идентификатор расчетного счета/кода в клиринговой организации
---@field settle_date number Дата расчетов
---@field qty number Количество инструментов в сделках
---@field qty_buy number Количество инструментов в заявках на покупку
---@field qty_sell number Количество инструментов в заявках на продажу
---@field netto number Нетто-позиция
---@field debit number Дебет
---@field credit number Кредит
---@field sec_code string Код инструмента заявки
---@field class_code string Код класса заявки
---@field planned_covered number Плановая позиция Т+
---Тип раздела. Возможные значения: \
--- 0 – торговый раздел; \
--- 1 – раздел обеспечения
---@field firm_use number

---@alias qlccp_holdings qluaAssetCommitmentsAndClaims

---Валюта: обязательства и требования по активам
---@class qluaCurrencyCommitmentsAndDemandsOnAssets
---@field sec_code string Код инструмента
---@field class_code string Код класса
---@field firmId string Идентификатор фирмы
---@field account string Торговый счет
---@field bank_acc_id string Идентификатор расчетного счета в НКЦ
---@field date number Дата расчётов
---@field debit number Размер денежных обязательств
---@field credit number Размер денежных требований
---@field value_buy number Сумма денежных средств в заявках на покупку
---@field value_sell number Сумма денежных средств в заявках на продажу
---@field margin_call number Сумма возврата компенсационного перевода
---@field planned_covered number Плановая позиция Т+
---@field debit_balance number Размер денежных обязательств на начало дня, с точностью до 2 знаков после десятичного разделителя
---@field credit_balance number Размер денежных требований на начало дня, с точностью до 2 знаков после десятичного разделителя

---@alias qlrm_holdings qluaCurrencyCommitmentsAndDemandsOnAssets

---Отчеты по сделкам для исполнения
---@class qluaReportsOnTradesForExecution
---@field report_num number Отчет
---@field report_date number Дата отчета
---@field flags number Набор битовых флагов
---@field userid string Идентификатор пользователя
---@field firmid string Идентификатор фирмы
---@field account string Счет депо
---@field cpfirmid string Код фирмы партнера
---@field cpaccount string Код торгового счета партнера
---@field qty number Количество инструментов, в лотах
---@field value number Объем сделки, выраженный в рублях
---@field withdraw_time number Время снятия заявки
---@field report_type number Тип отчета
---@field report_kind number Вид отчета
---@field commission number Объем комиссии по сделке, выраженный в руб
---@field sec_code string Код инструмента
---@field class_code string Код класса
---@field report_time number Время отчета
---@field report_date_time qluaDateTime Дата и время отчета

---@alias qlneg_deal_reports qluaReportsOnTradesForExecution

---Позиции по клиентским счетам (фьючерсы)
---@class qluaClientAccountPositionsFutures
---@field firmid string Идентификатор фирмы
---@field trdaccid string Торговый счет
---@field sec_code string Код фьючерсного контракта
---Тип лимита. Возможные значения: \
--- 0 – не определён; \
--- 1 – основной счет; \
--- 2 – клиентские и дополнительные счета; \
--- 4 – все счета торг. членов
---@field type number
---@field startbuy number Входящие длинные позиции
---@field startsell number Входящие короткие позиции
---@field startnet number Входящие чистые позиции
---@field todaybuy number Текущие длинные позиции
---@field todaysell number Текущие короткие позиции
---@field totalnet number Текущие чистые позиции
---@field openbuys number Активные на покупку
---@field opensells number Активные на продажу
---@field cbplused number Оценка текущих чистых позиций
---@field cbplplanned number Плановые чистые позиции
---@field varmargin number Вариационная маржа
---@field avrposnprice number Эффективная цена позиций
---@field positionvalue number Стоимость позиций
---@field real_varmargin number Реально начисленная в ходе клиринга вариационная маржа. Отображается с точностью до 2 двух знаков. При этом, в поле "varmargin" транслируется вариационная маржа, рассчитанная с учетом установленных границ изменения цены
---@field total_varmargin number Суммарная вариационная маржа по итогам основного клиринга начисленная по всем позициям. Отображается с точностью до 2 двух знаков
---Актуальный статус торговой сессии. Возможные значения: \
--- 0 – не определено; \
--- 1 – основная сессия; \
--- 2 – начался промклиринг; \
--- 3 – завершился промклиринг; \
--- 4 – начался основной клиринг; \
--- 5 – основной клиринг: новая сессия назначена; \
--- 6 – завершился основной клиринг; \
--- 7 – завершилась вечерняя сессия
---@field session_status number

---@alias qlfutures_client_holding qluaClientAccountPositionsFutures

---Свечки графика
---@class qluaChartCandlesticks
---@field open number Цена открытия
---@field close number Цена закрытия
---@field high number Максимальная цена сделки
---@field low number Минимальная цена сделки
---@field volume number Объем последней сделки
---@field datetime qluaDateTime Формат даты и времени
---Признак расчета индикатора при наличии свечки. Возможные значения: \
--- 0 – индикатор не рассчитан; \
--- 1 – индикатор рассчитан
---@field doesExist number

---Сделки
---@class qluaTradesDeals
---@field trade_num number Номер сделки в торговой системе
---@field order_num number Номер заявки в торговой системе
---@field brokerref string Комментарий, обычно: <код клиента>/<номер поручения>
---@field userid string Идентификатор трейдера
---@field firmid string Идентификатор дилера
---@field canceled_uid number Идентификатор пользователя, отказавшегося от сделки
---@field account string Торговый счет
---@field price number Цена
---@field qty number Количество инструментов в лотах
---@field value number Объем в денежных средствах
---@field accruedint number Накопленный купонный доход
---@field yield number Доходность
---@field settlecode string Код расчетов
---@field cpfirmid string Код фирмы партнера
---@field flags number Набор битовых флагов
---@field price2 number Цена выкупа
---@field reporate number Ставка РЕПО (%)
---@field client_code string Код клиента
---@field accrued2 number Доход (%) на дату выкупа
---@field repoterm number Срок РЕПО, в календарных днях repovalue number Сумма РЕПО
---@field repo2value number Объем выкупа РЕПО
---@field start_discount number Начальный дисконт (%)
---@field lower_discount number Нижний дисконт (%)
---@field upper_discount number Верхний дисконт (%)
---@field block_securities number Блокировка обеспечения ("Да"/"Нет")
---@field clearing_comission number Клиринговая комиссия (ММВБ)
---@field exchange_comission number Комиссия Фондовой биржи (ММВБ)
---@field tech_center_comission number Комиссия Технического центра (ММВБ)
---@field settle_date number Дата расчетов
---@field settle_currency string Валюта расчетов
---@field trade_currency string Валюта
---@field exchange_code string Код биржи в торговой системе
---@field station_id string Идентификатор рабочей станции
---@field sec_code string Код инструмента заявки
---@field class_code string Код класса
---@field datetime qluaDateTime Дата и время
---@field bank_acc_id string Идентификатор расчетного счета/кода в клиринговой организации
---@field broker_comission number Комиссия брокера. Отображается с точностью до 2 двух знаков. Поле зарезервировано для будущего использования.
---@field linked_trade number Номер витринной сделки в Торговой Системе для сделок РЕПО с ЦК и SWAP
---Период торговой сессии. Возможные значения: \
--- 0 – Открытие; \
--- 1 – Нормальный; \
--- 2 – Закрытие
---@field period number
---@field trans_id number Идентификатор транзакции
---Тип сделки. Возможные значения: \
--- 1 – Обычная; \
--- 2 – Адресная; \
--- 3 – Первичное размещение; \
--- 4 – Перевод денег/инструментов; \
--- 5 – Адресная сделка первой части РЕПО; \
--- 6 – Расчетная по операции своп; \
--- 7 – Расчетная по внебиржевой операции своп; \
--- 8 – Расчетная сделка бивалютной корзины; \
--- 9 – Расчетная внебиржевая сделка бивалютной корзины; \
--- 10 – Сделка по операции РЕПО с ЦК; \
--- 11 – Первая часть сделки по операции РЕПО с ЦК; \
--- 12 – Вторая часть сделки по операции РЕПО с ЦК; \
--- 13 – Адресная сделка по операции РЕПО с ЦК; \
--- 14 – Первая часть адресной сделки по операции РЕПО с ЦК; \
--- 15 – Вторая часть адресной сделки по операции РЕПО с ЦК; \
--- 16 – Техническая сделка по возврату активов РЕПО с ЦК; \
--- 17 – Сделка по спреду между фьючерсами разных сроков на один актив; \
--- 18 – Техническая сделка первой части от спреда между фьючерсами; \
--- 19 – Техническая сделка второй части от спреда между фьючерсами; \
--- 20 – Адресная сделка первой части РЕПО с корзиной; \
--- 21 – Адресная сделка второй части РЕПО с корзиной; \
--- 22 – Перенос позиций срочного рынка
---@field kind number
---@field clearing_bank_accid string Идентификатор счета в НКЦ (расчетный код)
---@field canceled_datetime qluaDateTime Дата и время снятия сделки
---@field clearing_firmid string Идентификатор фирмы - участника клиринга
---@field system_ref string Дополнительная информация по сделке, передаваемая торговой системой
---@field uid number Идентификатор пользователя на сервере QUIK lseccode string Приоритетное обеспечение
---@field order_revision_number number Номер ревизии заявки, по которой была совершена сделка
---@field order_qty number Количество в заявке на момент совершения сделки, в лотах
---@field order_price number Цена в заявке на момент совершения сделки
---@field order_exchange_code string Биржевой номер заявки
---@field exec_market string Площадка исполнения
---Индикатор ликвидности. Возможные значения: \
--- 0 – не определено; \
--- 1 – по заявке мейкера; \
--- 2 – по заявке тейкера; \
--- 3 – вывод ликвидности; \
--- 4 – по заявке в период аукциона
---@field liquidity_indicator number
---@field extref string Внешняя ссылка, используется для обратной связи с внешними системами
---@field ext_trade_flags number Расширенные флаги, полученные от шлюза напрямую, без вмешательства сервера QUIK. Поле не заполняется
---@field on_behalf_of_uid number UID пользователя, от имени которого совершена сделка
---Квалификатор клиента, от имени которого совершена сделка. Возможные значения: \
--- 0 – не определено; \
--- 1 – Natural Person; \
--- 3 – Legal Entity
---@field client_qualifier number
---@field client_short_code number Краткий идентификатор клиента, от имени которого совершена сделка
---Квалификатор принявшего решение о совершении сделки. Возможные значения: \
--- 0 – не определено; \
--- 1 – Natural Person; \
--- 3 – Algorithm
---@field investment_decision_maker_qualifier number
---@field investment_decision_maker_short_code number Краткий идентификатор принявшего решение о совершении сделки
---Квалификатор трейдера, исполнившего заявку, по которой совершена сделка.Возможные значения: \
--- 0 – не определено; \
--- 1 – Natural Person; \
--- 3 – Algorithm
---@field executing_trader_qualifier number
---@field executing_trader_short_code number Краткий идентификатор трейдера, исполнившего заявку, по которой совершена сделка
---Признак того, что транзакция совершена по правилам пре-трейда. Возможные значения битовых флагов: \
---бит 0 (0x1) – RFPT; \
---бит 1 (0x2) – NLIQ; \
---бит 2 (0x4) – OILQ; \
---бит 3 (0x8) – PRC; \
---бит 4 (0x10) – SIZE; \
---бит 5 (0x20) – ILQD
---@field waiver_flag number
---@field mleg_base_sid number Идентификатор базового инструмента на сервере для multileg-инструментов
---Квалификатор операции. Возможные значения: \
--- 0 – не определено; \
--- 1 – Buy; \
--- 2 – Sell; \
--- 3 – Sell short; \
--- 4 – Sell short exempt; \
--- 5 – Sell undiclosed
---@field side_qualifier number
---OTC post-trade индикатор. Возможные значения битовых флагов: \
---бит 0 (0x1) – Benchmark; \
---бит 1 (0x2) – Agency cross; \
---бит 2 (0x4) – Large in scale; \
---бит 3 (0x8) – Illiquid instrument; \
---бит 4 (0x10) – Above specified size; \
---бит 5 (0x20) – Cancellations; \
---бит 6 (0x40) – Amendments; \
---бит 7 (0x80) – Special dividend; \
---бит 8 (0x100) – Price improvement; \
---бит 9 (0x200) – Duplicative; \
---бит 10 (0x400) – Not contributing to the price discovery process; \
---бит 11 (0x800) – Package; \
---бит 12 (0x1000) – Exchange for Physical
---@field otc_post_trade_indicator number
---Роль в исполнении заявки. Возможные значения: \
--- 0 – не определено; \
--- 1 – Agent; \
--- 2 – Principal; \
--- 3 – Riskless principal; \
--- 4 – CFG give up; \
--- 5 – Cross as agent; \
--- 6 – Matched principal; \
--- 7 – Proprietary; \
--- 8 – Individual; \
--- 9 – Agent for other member; \
--- 10 – Mixed; \
--- 11 – Market maker
---@field capacity number
---@field cross_rate number Кросс-курс валюты цены сделки к валюте расчетов по сделке
---@field fixing_date number Дата фиксации котировки для расчетов. Заполняется для контрактов типа NDF (см. параметр `operation_type`)
---@field start_date number Дата, начиная с которой допускается совершение валютирования. Заполняется только для контрактов типа "FLEX FORWARD" (см. параметр `operation_type`)
---Тип совершаемой операции. Возможные значения: \
--- -1 – NOT_DEFINED; \
--- 0 – SPOT; \
--- 1 – FORWARD; \
--- 2 – SWAP; \
--- 6 – NDF; \
--- 7 – FLEX FORWARD
---@field operation_type number
---@field spot_rate number Цена котировки по спот-инструменту в момент совершения сделки
---@field ts_commission_currency string Код валюты комиссии торговой системы
---@field broker_commission_currency string Код валюты комиссии брокера
---Идентификатор торговой сессии. Возможные значения: \
--- 0 – Не определено; \
--- 1 – Основная сессия; \
--- 2 – Дополнительная сессия; \
--- 3 – Итоги дня
---@field trading_session number
---@field benchmark string Идентификатор индикативной ставки
---Тип сделки депозита. Возможные значения: \
--- 0 – сделка не типа "депозит"; \
--- 1 – "Намерение"; \
--- 2 – "Депозит"; \
--- 3 – "Изъятие"; \
--- 4 – "Закрытие планового пополнения"; \
--- 5 – "Принудительное закрытие"; \
--- 6 – "Перенос пополнения"
---@field deposit_intent number
---@field open_repo2date number День Т+1 для сделок РЕПО с Открытой датой
---@field open_repo2value number Стоимость выкупа РЕПО с открытой датой в день T+1

---@alias qltrades qluaTradesDeals

---Сделки для исполнения
---@class qluaTradesForExecution
---@field trade_num number Номер сделки
---@field trade_date number Дата торгов
---@field settle_date number Дата расчетов
---@field flags number Набор битовых флагов
---@field brokerref string Комментарий, обычно: <код клиента>/<номер поручения>
---@field firmid string Идентификатор дилера
---@field account string Счет депо
---@field cpfirmid string Код фирмы партнера
---@field cpaccount string Счет депо партнера
---@field price number Цена
---@field qty number Количество
---@field value number Объем
---@field settlecode string Код расчетов
---@field report_num number Отчет
---@field cpreport_num number Отчет партнера
---@field accruedint number Купонный процент
---@field repotradeno number Номер сделки 1-ой части РЕПО
---@field price1 number Цена 1-ой части РЕПО
---@field reporate number Ставка РЕПО (%)
---@field price2 number Цена выкупа
---@field client_code string Код клиента
---@field ts_comission number Комиссия торговой системы
---@field balance number Остаток
---@field settle_time number Время исполнения
---@field amount number Сумма обязательства
---@field repovalue number Сумма РЕПО
---@field repoterm number Срок РЕПО
---@field repo2value number Объем выкупа РЕПО
---@field return_value number Сумма возврата РЕПО
---@field discount number Дисконт (%)
---@field lower_discount number Нижний дисконт (%)
---@field upper_discount number Верхний дисконт (%)
---@field block_securities number Блокировать обеспечение ("Да"/"Нет")
---@field urgency_flag number Исполнить ("Да"/"Нет")
---Тип. Возможные значения: \
--- 0 – Внесистемная сделка, \
--- 1 – Первая часть сделки РЕПО, \
--- 2 – Вторая часть сделки РЕПО, \
--- 3 – Компенсационный взнос, \
--- 4 – Дефолтер: отложенные обязательства и требования, \
--- 5 – Пострадавший: отложенные обязательства и требования.
---@field type number
---Направленность. Возможные значения: \
--- 1 – Зачислить, \
--- 2 – Списать.
---@field operation_type number
---@field expected_discount number Дисконт после взноса (%)
---@field expected_quantity number Количество после взноса
---@field expected_repovalue number Сумма РЕПО после взноса
---@field expected_repo2value number Стоимость выкупа после взноса
---@field expected_return_value number Сумма возврата после взноса
---@field order_num number Номер заявки
---@field report_trade_date number Дата заключения
---Состояние расчетов по сделке. Возможные значения: \
--- 1 – Processed, \
--- 2 – Not processed, \
--- 3 – Is processing.
---@field settled number
---Тип клиринга. Возможные значения: \
--- 1 – Not set, \
--- 2 – Simple, \
--- 3 – Multilateral.
---@field clearing_type number
---@field report_comission number Комиссия за отчет
---@field coupon_payment number Купонная выплата
---@field principal_payment number Выплата по основному долгу
---@field principal_payment_date number Дата выплаты по основному долгу
---@field nextdaysettle number Дата следующего дня расчетов
---@field settle_currency string Валюта расчетов
---@field sec_code string Код инструмента
---@field class_code string Код класса
---@field compval number Сумма отступного в валюте сделки
---@field parenttradeno number Идентификационный номер витринной сделки
---@field bankid string Расчетная организация
---@field bankaccid string Код позиции
---@field precisebalance number Количество инструментов к исполнению (в лотах)
---@field confirmtime number Время подтверждения в формате <ЧЧММСС>
---Расширенные флаги сделки для исполнения. Возможные значения: \
--- 1 – Подтверждена контрагентом; \
--- 2 – Подтверждена
---@field ex_flags number
---@field confirmreport number Номер поручения
---@field extref string Внешняя ссылка, используется для обратной связи с внешними системами
---@field benchmark string Идентификатор индикативной ставки
---@field benchmark_change_date number Дата изменения индикатора в формате <ГГГГММДД>
---@field benchmark_value number Значение индикатора, в %
---@field cancel_reason string Причина отмены
---Тип сделки депозита. Возможные значения: \
--- 0 – сделка не типа "депозит"; \
--- 1 – "Намерение"; \
--- 2 – "Депозит"; \
--- 3 – "Изъятие"; \
--- 4 – "Закрытие планового пополнения"; \
--- 5 – "Принудительное закрытие"; \
--- 6 – "Перенос пополнения"
---@field deposit_intent number
---@field open_repo2date number День Т+1 для сделок РЕПО с Открытой датой
---@field open_repo2value number Стоимость выкупа РЕПО с открытой датой в день T+1
---@field open_repo_report_no number Отчет на закрытие сделки РЕПО с Открытой датой
---Статус РЕПО с открытой датой. Возможные значения: \
--- 0 – "Нет"; \
--- 1 – "Да"; \
--- 2 – "Срочная"
---@field open_repo_status number

---@alias qlneg_trades qluaTradesForExecution

---Стоп-заявки
---@class qluaStopOrders
---@field order_num number Регистрационный номер стоп-заявки на сервере QUIK
---@field ordertime number Время выставления
---@field flags number Набор битовых флагов
---@field brokerref string Комментарий, обычно: <код клиента>/<номер поручения>
---@field firmid string Идентификатор дилера
---@field account string Торговый счет
---Направленность стоп-цены. Возможные значения: \
--- 4 – <=, \
--- 5 – >=
---@field condition number
---@field condition_price number Стоп-цена
---@field price number Цена
---@field qty number Количество в лотах
---@field linkedorder number Номер заявки в торговой системе, зарегистрированной по наступлению условия стоп-цены
---@field expiry number Дата окончания срока действия заявки
---@field trans_id number Идентификатор транзакции
---@field client_code string Код клиента
---@field co_order_num number Связанная заявка
---@field co_order_price number Цена связанной заявки
---Вид стоп заявки. Возможные значения: \
--- 1 – стоп-лимит; \
--- 2 – условие по другому инструменту; \
--- 3 – со связанной заявкой; \
--- 6 – тейк-профит; \
--- 7 – стоп-лимит по исполнению активной заявки; \
--- 8 – тейк-профит по исполнению активной заявки; \
--- 9 - тейк-профит и стоп-лимит
---@field stop_order_type number
---@field orderdate number Дата выставления
---@field alltrade_num number Сделка условия
---@field stopflags number Набор битовых флагов
---@field offset number Отступ от min/max
---@field spread number Защитный спред
---@field balance number Активное количество
---@field uid number Идентификатор пользователя
---@field filled_qty number Исполненное количество
---@field withdraw_time number Время снятия заявки
---@field condition_price2 number Стоп-лимит цена (для заявок типа "Тэйк-профит и стоп-лимит")
---@field active_from_time number Время начала периода действия заявки типа "Тэйк-профит и стоп-лимит"
---@field active_to_time number Время окончания периода действия заявки типа "Тэйк-профит и стоп-лимит"
---@field sec_code string Код инструмента заявки
---@field class_code string Код класса заявки
---@field condition_sec_code string Код инструмента стоп-цены
---@field condition_class_code string Код класса стоп-цены
---@field canceled_uid number Идентификатор пользователя, снявшего стоп-заявку
---@field order_date_time qluaDateTime Время выставления стоп-заявки
---@field withdraw_datetime qluaDateTime Время снятия стоп-заявки
---@field activation_date_time qluaDateTime Дата и время активации стоп-заявки

---@alias qlstop_orders qluaStopOrders

---Позиции участника по инструментам
---@class qluaParticipantsPositionsInInstruments
---@field firmid string Идентификатор фирмы
---@field sec_code string Код инструмента
---@field openbal number Входящий остаток
---@field currentpos number Текущий остаток
---@field plannedposbuy number Количество инструментов в активных заявках на покупку
---@field plannedpossell number Количество инструментов в активных заявках на продажу
---@field usqtyb number Куплено
---@field usqtys number Продано

---@alias qlfirm_holding qluaParticipantsPositionsInInstruments

---Позиции участника по торговым счетам
---@class qluaParticipantsPositionsOnTradingAccounts
---@field firmid string Идентификатор фирмы
---@field sec_code string Код инструмента
---@field trdaccid string Торговый счет
---@field depaccid string Счет депо
---@field openbal number Входящий остаток
---@field currentpos number Текущий остаток
---@field plannedpossell number Плановая продажа
---@field plannedposbuy number Плановая покупка
---@field planbal number Контрольный остаток простого клиринга, равен входящему остатку минус плановая позиция на продажу, включенная в простой клиринг
---@field usqtyb number Куплено
---@field usqtys number Продано
---@field planned number Плановый остаток, равен текущему остатку минус плановая позиция на продажу
---@field settlebal number Плановая позиция после проведения расчетов
---@field bank_acc_id string Идентификатор расчетного счета/кода в клиринговой организации
---Признак счета обеспечения. Возможные значения: \
--- 0 – для обычных счетов, \
--- 1 – для счета обеспечения.
---@field firmuse number

---@alias qlaccount_balance qluaParticipantsPositionsOnTradingAccounts

---Удаление позиции по инструментам
---@class qluaDeletingInstrumentPosition
---@field sec_code string Код инструмента
---@field trdaccid string Код торгового счета
---@field firmid string Идентификатор фирмы
---@field client_code string Код клиента
---Срок расчётов. Возможные значения: \
--- - положительные целые числа, начиная с 0, соответствующие срокам расчетов из таблицы Позиции по инструментам: 0 – T0, 1 – T1, 2 – T2 и т.д.; \
--- - отрицательные целые числа – технологические лимиты (используются для внутренней работы системы QUIK)
---@field limit_kind number

---Удаление позиции по денежным средствам
---@class qluaDeletingCashPosition
---@field currcode string Код валюты
---@field tag string Код позиции
---@field client_code string Код клиента
---@field firmid string Идентификатор фирмы
---Срок расчётов. Возможные значения: \
--- - положительные целые числа, начиная с 0, соответствующие срокам расчётов из таблицы Лимиты Позиции по деньгам: 0 – T0, 1 – T1, 2 – T2 и т.д.; \
--- - отрицательные целые числа – технологические лимиты (используются для внутренней работы системы QUIK)
---@field limit_kind number

---Удаление фьючерсного лимита
---@class qluaDeletingFuturesLimit
---@field trdaccid string Код торгового счета
---Тип лимита. Возможные значения: \
--- 0 – Денежные средства; \
--- 1 – Залоговые денежные средства; \
--- 2 – По совокупным средствам; \
--- 3 – Клиринговые денежные средства; \
--- 4 – Клиринговые залоговые денежные средства; \
--- 5 – Лимит открытых позиций на спот-рынке; \
--- 6 – Суммарные залоговые средства в иностранной валюте (в рублях); \
--- 7 – Залоговые средства в иностранной валюте
---@field limit_type number

---Торговые счета
---@class qluaTradingAccounts
---@field class_codes string Список кодов классов, разделенных символом "|"
---@field firmid string Идентификатор фирмы
---@field trdaccid string Код торгового счета
---@field description string Описание
---Запрет необеспеченных продаж. Возможные значения: \
--- 0 – Нет; \
--- 1 – Да
---@field fullcoveredsell number
---@field main_trdaccid string Основной торговый счет
---@field bankid_t0 string Расчетная организация по "Т0"
---@field bankid_tplus string Расчетная организация по "Т+"
---@field trdacc_type number Тип торгового счета
---@field depunitid string Раздел счета Депо
---Статус торгового счета. Возможные значения: \
--- 0 – операции разрешены; \
--- 1 – операции запрещены
---@field status number
---Тип раздела. Возможные значения: \
--- 0 – раздел обеспечения; \
--- иначе – для торговых разделов
---@field firmuse number
---@field depaccid string Номер счета депо в депозитарии
---@field bank_acc_id string Код дополнительной позиции по денежным средствам
---@field flags number Набор битовых флагов. Возможные значения: бит 0 (0x1) – Торгово-клиринговый счет для рынка депозитов

---@alias qltrade_accounts qluaTradingAccounts

---Транзакции: Заявка
---@class qluaTransactionsOrderN
---@field first_ordernum number Параметр заявки, обозначающий номер первой заявки, которая выставлялась при автоматической замене кода клиента. Используется, если на сервере QUIK настроена замена кода клиента для кросс-сделки
---@field order_num number Параметр заявки, обозначающий номер заявки
---@field price number Параметр заявки, обозначающий цену
---@field quantity number Параметр заявки, обозначающий количество
---@field balance number Параметр заявки, обозначающий остаток
---@field order_flags number Параметр заявки, обозначающий флаги. Возможные значения: "бит 2 (0x4)" (заявка на продажу, иначе – на покупку). Значение параметра применимо только для транзакций с параметром направления операции (купля / продажа), в остальных случаях параметр имеет значение "0"
---@field firm_id string Параметр заявки, обозначающий идентификатор фирмы
---@field account string Параметр заявки, обозначающий торговый счет
---@field client_code string Параметр заявки, обозначающий код клиента
---@field brokerref string Параметр заявки, обозначающий комментарий
---@field exchange_code string Параметр заявки, обозначающий биржевой номер заявки
---@field sec_code string Параметр заявки, обозначающий код инструмента
---@field class_code string Параметр заявки, обозначающий код класса

---Транзакции: Заявки
---@class qluaTransactionsOrders
---@field order_0 qluaTransactionsOrderN Заявка
---@field order_1 qluaTransactionsOrderN Заявка
---@field order_2 qluaTransactionsOrderN Заявка
---@field order_3 qluaTransactionsOrderN Заявка
---@field order_4 qluaTransactionsOrderN Заявка
---@field order_5 qluaTransactionsOrderN Заявка
---@field order_6 qluaTransactionsOrderN Заявка
---@field order_7 qluaTransactionsOrderN Заявка
---@field order_8 qluaTransactionsOrderN Заявка
---@field order_9 qluaTransactionsOrderN Заявка

---Транзакции
---@class qluaTransactions
---@field trans_id number Пользовательский идентификатор транзакции
---Статус транзакции. Возможные значения: \
--- 0 – транзакция отправлена серверу; \
--- 1 – транзакция получена на сервер QUIK от клиента; \
--- 2 – ошибка при передаче транзакции в торговую систему. Так как отсутствует подключение шлюза Московской Биржи, повторно транзакция не отправляется; \
--- 3 – транзакция выполнена; \
--- 4 – транзакция не выполнена торговой системой. Более подробное описание ошибки отражается в поле Сообщение; \
--- 5 – транзакция не прошла проверку сервера QUIK по каким-либо критериям. Например, проверку на наличие прав у пользователя на отправку транзакции данного типа; \
--- 6 – транзакция не прошла проверку лимитов сервера QUIK; \
--- 10 – транзакция не поддерживается торговой системой; \
--- 11 – транзакция не прошла проверку правильности электронной цифровой подписи; \
--- 12 – не удалось дождаться ответа на транзакцию, т.к. истек таймаут ожидания. Может возникнуть при подаче транзакций из QPILE; \
--- 13 – транзакция отвергнута, так как ее выполнение могло привести к кросс-сделке (т.е. сделке с тем же самым клиентским счетом); \
--- 14 – транзакция не прошла контроль дополнительных ограничений, установленных брокером; \
--- 15 – транзакция принята после нарушения дополнительных ограничений, установленных брокером; \
--- 16 – транзакция отменена пользователем в ходе проверки дополнительных ограничений, установленных брокером
---@field status number
---@field result_msg string Сообщение
---@field date_time qluaDateTime Дата и время
---@field uid number Идентификатор
---@field flags number Флаги транзакции
---@field order_flags number Параметр заявки, обозначающий флаги. Возможные значения: "бит 2 (0x4)" (заявка на продажу, иначе – на покупку). Значение параметра применимо только для транзакций с параметром направления операции (купля / продажа), в остальных случаях параметр имеет значение "0"
---@field server_trans_id number Идентификатор транзакции на сервере
---@field order_num nil|number Номер заявки
---@field price nil|number Цена
---@field quantity nil|number Количество
---@field balance nil|number Остаток
---@field firm_id nil|string Идентификатор фирмы
---@field account nil|string Торговый счет
---@field client_code nil|string Код клиента
---@field brokerref nil|string Комментарий
---@field class_code nil|string Код класса
---@field sec_code nil|string Код инструмента
---@field exchange_code nil|string Биржевой номер заявки
---@field error_code number Числовой код ошибки. Значение равно "0", если транзакция выполнена успешно
---Источник сообщения. Возможные значения: \
--- 1 – Торговая система; \
--- 2 – Сервер QUIK; \
--- 3 – Библиотека расчёта лимитов; \
--- 4 – Шлюз торговой системы
---@field error_source number
---@field first_ordernum number Номер первой заявки, которая выставлялась при автоматической замене кода клиента. Используется, если на сервере QUIK настроена замена кода клиента для кросс-сделки
---@field gate_reply_time qluaDateTime Дата и время получения шлюзом ответа на транзакцию
---@field sent_local_time qluaDateTime Дата и время отправки транзакции, локальное время клиента в UTC
---@field got_local_time qluaDateTime Дата и время получения ответа на транзакцию, локальное время клиента в UTC
---@field orders qluaTransactionsOrders Заявки. Параметр добавляется в ответ на транзакцию только при наличии двух и более заявок, связанных с транзакцией

---Фирмы
---@class qluaFirms
---@field firmid string Идентификатор фирмы
---@field firm_name string Название класса
---@field status number Статус
---@field exchange string Торговая площадка

---@alias qlfirms qluaFirms

--#endregion

--#region Сервисные функции

---Функция предназначена для определения состояния подключения клиентского места к серверу. \
--- \
---Возвращает "1", если клиентское место подключено и "0", если не подключено.
---@return number
function isConnected() end

---Функция возвращает путь, по которому находится запускаемый скрипт, без завершающего обратного слеша ("\"). Например, "C:\QuikFront\Scripts"
---@return string
function getScriptPath() end

---Функция возвращает значения параметров информационного окна (пункт меню Система / О программе / Информационное окно…).
---@param param_name string
---@return string
function getInfoParam(param_name) end

---Функция отображает сообщения в терминале QUIK. Возвращает `nil` при ошибке выполнения или при обнаружении ошибки во входных параметрах. В остальных случаях возвращает "1". \
--- \
---Максимальная длина сообщений об ошибках выполнения скрипта и строк, передаваемых в функцию message(), составляет 900 символов.
---@param message string
---@param icon_type? number 1=(i) 2=/!\ 3=(X)
---@return number?
function message(message, icon_type) end

---Функция приостанавливает выполнение скрипта. Возвращает `nil` при обнаружении ошибки во входных параметрах. В случае успешного завершения возвращает время ожидания, заданное параметром "time". \
--- \
---Функцию sleep не рекомендуется использовать в функциях обратного вызова.
---@param msec number Время, на которое приостанавливается выполнение, в миллисекундах.
---@return number?
function sleep(msec) end

---Функция возвращает путь, по которому находится файл info.exe, исполняющий данный скрипт, без завершающего обратного слеша ("\"). Например, "C:\QuikFront".
---@return string
function getWorkingFolder() end

---Функция для вывода отладочной информации.
---@param text string
function PrintDbgStr(text) end

---Функция возвращает системные дату и время с точностью до микросекунд. \
--- \
---Функция использует системные вызовы операционной системы Windows и ее значения зависят от интервала между прерываниями системного таймера.
---@return qluaDateTime
function os.sysdate() end

---Функция позволяет получить информацию о том, в какой теме оформления интерфейса в настоящий момент работает терминал: стандартной или тёмной.
---@return boolean
function isDarkTheme() end

--#endregion

--#region Функции обратного вызова

---Функция, реализующая основной поток выполнения в скрипте. Для ее выполнения терминал QUIK создает отдельный поток. Скрипт считается работающим, пока работает функция main(). \
--- \
---При завершении работы функции main() скрипт переходит в состояние "остановлен". Если скрипт находится в состоянии "остановлен", то не происходит вызовов функций обработки событий терминала QUIK, содержащихся в этом скрипте.
function main() end

---Функция вызывается терминалом QUIK при получении изменений текущей позиции по счету.
---@param acc_bal qluaParticipantsPositionsOnTradingAccounts Таблица позиций участника по торговым счетам
function OnAccountBalance(acc_bal) end

---Функция вызывается терминалом QUIK при изменении позиции участника по денежным средствам.
---@param acc_pos qluaParticipantsCashPositions Таблица "Позиции участника по деньгам"
function OnAccountPosition(acc_pos) end

---Функция вызывается терминалом QUIK при получении обезличенной сделки.
---@param alltrade qluaAnonymizedDeals Таблица с параметрами обезличенной сделки
function OnAllTrade(alltrade) end

---Функция вызывается терминалом QUIK в следующих случаях: \
--- - смена сервера QUIK внутри торговой сессии; \
--- - смена пользователя, которым выполняется подключение к серверу QUIK, внутри торговой сессии; \
--- - смена сессии. \
--- \
---При выполнении сразу нескольких из перечисленных условий, функция OnCleanUp() вызывается терминалом QUIK для каждого из них.
---Под сменой сессии подразумевается изменение идентификатора сессии при подключении к серверу QUIK.
function OnCleanUp() end

---Функция вызывается перед закрытием терминала QUIK и при выгрузке файла qlua.dll. \
--- \
---Под выгрузкой файла qlua.dll подразумевается отключение плагина QLua в окне "Версии компонентов и плагинов" (см. п. 1.9. Раздела 1 Руководства пользователя QUIK).
function OnClose() end

---Функция вызывается терминалом QUIK при установлении связи с сервером QUIK и получении терминалом описания хотя бы одного класса. \
--- \
---Если в течение торгового дня терминал получает новый класс, то функция вызывается еще раз, при этом параметр вызова flag принимает значение "false".
---@param flag boolean
function OnConnected(flag) end

---Функция вызывается терминалом QUIK при получении изменений позиции по инструментам.
---@param dlimit qluaPositionsInInstruments Таблица "Позиции по инструментам"
function OnDepoLimit(dlimit) end

---Функция вызывается терминалом QUIK при удалении позиции клиента по инструментам.
---@param dlimit_del qluaDeletingInstrumentPosition Таблица с параметрами удаляемой позиции по инструментам
function OnDepoLimitDelete(dlimit_del) end

---Функция вызывается терминалом QUIK при отключении от сервера QUIK.
function OnDisconnected() end

---Функция вызывается терминалом QUIK при получении описания новой фирмы от сервера.
---@param firm qluaFirms Таблица с параметрами фирмы
function OnFirm(firm) end

---Функция вызывается терминалом QUIK при изменении позиции по срочному рынку.
---@param fut_pos qluaClientAccountPositionsFutures Таблица с описанием позиции по срочному рынку
function OnFuturesClientHolding(fut_pos) end

---Функция вызывается терминалом QUIK при получении изменений ограничений по срочному рынку.
---@param fut_limit qluaClientAccountLimits Таблица "Ограничения по клиентским счетам"
function OnFuturesLimitChange(fut_limit) end

---Функция вызывается терминалом QUIK при удалении лимита по срочному рынку.
---@param lim_del qluaDeletingFuturesLimit Таблица с параметрами удаляемого лимита по срочному рынку
function OnFuturesLimitDelete(lim_del) end

---Функция вызывается терминалом QUIK перед вызовом функции main(). В качестве параметра принимает значение полного пути к запускаемому скрипту. \
--- \
---В данной функции пользователь имеет возможность инициализировать все необходимые переменные и библиотеки перед запуском основного потока main().
---@param script_path string
function OnInit(script_path) end

---Функция вызывается терминалом QUIK при получении изменений по денежной позиции.
---@param mlimit qluaCashPositions Таблица "Позиции по деньгам"
function OnMoneyLimit(mlimit) end

---Функция вызывается терминалом QUIK при удалении денежной позиции.
---@param mlimit_del qluaDeletingCashPosition Таблица с параметрами удаляемой позиции по денежным средствам
function OnMoneyLimitDelete(mlimit_del) end

---Функция вызывается терминалом QUIK при получении внебиржевой заявки или при изменении параметров существующей внебиржевой заявки.
---@param neg_deals qluaOrdersNegotiatedDeal Таблица с параметрами заявки на внебиржевые сделки
function OnNegDeal(neg_deals) end

---Функция вызывается терминалом QUIK при получении сделки для исполнения или при изменении параметров существующей сделки для исполнения.
---@param neg_trade qluaTradesForExecution Таблица с параметрами заявки
function OnNegTrade(neg_trade) end

---Функция вызывается терминалом QUIK при получении новой заявки или при изменении параметров существующей заявки.
---@param order qluaOrders Таблица с параметрами заявки
function OnOrder(order) end

---Функция вызывается терминалом QUIK при изменении текущих параметров. \
--- \
---При вызове данной функции пользователь может вызвать функцию getParamEx() и получить значение нужного параметра.
---@param class_code string Код класса
---@param sec_code string Код инструмента
function OnParam(class_code, sec_code) end

---Функция вызывается терминалом QUIK при получении изменения стакана котировок. \
--- \
---После вызова данной функции запросить нужную таблицу котировок можно с помощью функции getQuoteLevel2().
---@param class_code string Код класса
---@param sec_code string Код инструмента
function OnQuote(class_code, sec_code) end

---Функция вызывается терминалом QUIK при остановке скрипта из диалога управления и при закрытии терминала QUIK. \
--- \
---Функция возвращает количество миллисекунд, которое дается скрипту на завершение работы. Если функция не возвращает число, то таймаут завершения работы скрипта остается равным 5 секундам. \
--- \
---По истечении интервала времени, данного скрипту на завершение работы, функция main() завершается принудительно. При этом возможна потеря системных ресурсов.
---@param flag number При остановке или удалении работающего скрипта Lua из диалога управления "Доступные скрипты" параметр вызова flag принимает значение 1. При закрытии терминала QUIK – значение 2.
---@return number? #Time out
function OnStop(flag) end

---Функция вызывается терминалом QUIK при получении новой стоп-заявки или при изменении параметров существующей стоп-заявки.
---@param stop_order qluaStopOrders Таблица с параметрами стоп-заявки
function OnStopOrder(stop_order) end

---Функция вызывается терминалом QUIK при получении сделки или при изменении параметров существующей сделки.
---@param trade qluaTradesDeals Таблица с параметрами сделки
function OnTrade(trade) end

---Функция OnTransReply вызывается терминалом QUIK при получении ответа на транзакцию пользователя, отправленную с помощью любого плагина Рабочего места QUIK (в том числе QLua). \
--- \
---Для транзакций, отправленных с помощью Trans2quik.dll, QPILE или динамической загрузки транзакций из файла, функция не вызывается.
---@param trans_reply qluaTransactions Таблица с описанием транзакций
function OnTransReply(trans_reply) end

--#endregion

--#region Функции для обращения к строкам произвольных таблиц QUIK

---Функция возвращает таблицу Lua, содержащую информацию о данных из строки с номером "Index" из таблицы с именем "TableName". \
---Можно указать ```---@type ql...```:
---```
--- ---@type qlmoney_limits
--- local tbl = getItem("money_limits", 2)
---```
---@param TableName string Имена таблиц в справке "Таблицы, используемые в функциях getItem, getNumberOf и SearchItems"
---@param Index number Индекс элементов в таблице начинается с 0
---@return table? #В случае неуспешного завершения функция возвращает `nil`
function getItem(TableName, Index) end

---Функция возвращает таблицу Lua, содержащую описание параметров Таблицы заявок и индекс заявки в хранилище терминала. \
--- \
---Если заявка с указанным номером не существует, то возвращаемые параметры - `nil`.
---@param class_code string
---@param order_id number
---@return qluaOrders?
---@return number?
function getOrderByNumber(class_code, order_id) end

---Функция возвращает количество записей в таблице "TableName".
---@param TableName string Имена таблиц в справке "Таблицы, используемые в функциях getItem, getNumberOf и SearchItems"
---@return number
function getNumberOf(TableName) end

---Функция позволяет реализовать быструю выборку элементов из хранилища терминала и возвращает таблицу с индексами элементов, удовлетворяющих условию поиска. \
---Можно указать ```---@type ql...```:
---```
--- ---@type qlmoney_limits
--- local tbl = SearchItems("money_limits", 0, 2, fn)
---```
---@param table_name string Имена таблиц в справке "Таблицы, используемые в функциях getItem, getNumberOf и SearchItems"
---@param start_index number Индекс стартового элемента для поиска
---@param end_index number Индекс конечного элемента поиска
---@param fn function Функция обратного вызова, возвращающая одно из следующих значений: \
--- - true – текущий индекс учитывается в результате; \
--- - false – текущий индекс не учитывается в результате; \
--- - nil – поиск прерывается, функция SearchItems возвращает таблицу с индексами, найденными ранее, включая текущий индекс.
---@param params? string Определяет список полей элемента таблицы `table_name` для передачи в функцию `fn`. Поля задаются через запятую, пробелы игнорируются. Если строка params не задана, то в функцию fn элемент из хранилища терминала передается полностью. Необязательный параметр. Примеры с использованием params приведены в Приложении 4.
---@return table? #При возникновении ошибки в функции fn функция SearchItems прерывает свою работу и возвращает `nil`.
function SearchItems(table_name, start_index, end_index, fn, params) end

--#endregion

--#region Функции для обращения к спискам доступных параметров

---Функция предназначена для получения списка кодов классов, переданных с сервера в ходе сеанса связи. Коды классов в списке разделяются запятой ",". В конце полученной строки всегда дописывается символ ",".
---@return string
function getClassesList() end

---Функция предназначена для получения информации о классе.
---@param class_code string
---@return qluaClasses
function getClassInfo(class_code) end

---Функция предназначена для получения списка кодов инструментов для списка классов, заданного списком кодов. Коды инструментов в списке разделяются запятой ",". В конце полученной строки всегда дописывается символ ",".
---@param class_code string
---@return string
function getClassSecurities(class_code) end

--#endregion

--#region Функции взаимодействия скрипта Lua и Рабочего места QUIK

---@class fngetMoneyReturn
---@field money_open_limit number Входящий лимит по денежным средствам
---@field money_limit_locked_nonmarginal_value number Стоимость немаржинальных инструментов в заявках на покупку
---@field money_limit_locked number Заблокированное в заявках на покупку количество денежных средств
---@field money_open_balance number Входящий остаток по денежным средствам
---@field money_current_limit number Текущий лимит по денежным средствам
---@field money_current_balance number Текущий остаток по денежным средствам
---@field money_limit_available number Доступное количество денежных средств

---Функция предназначена для получения информации по денежным позициям.
---@param client_code string
---@param firmid string
---@param tag string
---@param currcode string
---@return fngetMoneyReturn
function getMoney(client_code, firmid, tag, currcode) end

---Функция предназначена для получения информации по денежным позициям указанного типа.
---@param firmid string
---@param client_code string
---@param tag string
---@param currcode string
---@param limit_kind number
---@return qluaCashPositions? #Таблица "Позиции по деньгам" или `nil`
function getMoneyEx(firmid, client_code, tag, currcode, limit_kind) end

---@class fngetDepoReturn
---@field depo_limit_locked_buy_value number Стоимость инструментов, заблокированных на покупку
---@field depo_current_balance number Текущий остаток по инструментам
---@field depo_limit_locked_buy number Количество лотов инструментов, заблокированных на покупку
---@field depo_limit_locked number Заблокированное Количество лотов инструментов
---@field depo_limit_available number Доступное количество инструментов
---@field depo_current_limit number Текущий лимит по инструментам
---@field depo_open_balance number Входящий остаток по инструментам
---@field depo_open_limit number Входящий лимит по инструментам

---Функция предназначена для получения позиций по инструментам.
---@param client_code string
---@param firmid string
---@param sec_code string
---@param trdaccid string
---@return fngetDepoReturn
function getDepo(client_code, firmid, sec_code, trdaccid) end

---Функция предназначена для получения позиций по инструментам указанного типа.
---@param firmid string
---@param client_code string
---@param sec_code string
---@param trdaccid string
---@param limit_kind number
---@return qluaPositionsInInstruments? #Таблица "Позиции по инструментам" или `nil`
function getDepoEx(firmid, client_code, sec_code, trdaccid, limit_kind) end

---Функция предназначена для получения информации по фьючерсным лимитам. \
--- \
---Если необходимо получить информацию по фьючерсному лимиту без валюты, то в качестве curr_code задается пустая строка.
---@param firmid string
---@param trdaccid string
---@param limit_type number
---@param currcode string
---@return qluaClientAccountLimits? #Таблица "Ограничения по клиентским счетам" или `nil`
function getFuturesLimit(firmid, trdaccid, limit_type, currcode) end

---Функция предназначена для получения информации по фьючерсным позициям.
---@param firmid string
---@param trdaccid string
---@param sec_code string
---@param type number
---@return qluaClientAccountPositionsFutures? #Таблица "Позиции по клиентским счетам (фьючерсы)" или `nil`
function getFuturesHolding(firmid, trdaccid, sec_code, type) end

---Функция предназначена для получения информации по инструменту.
---@param class_code string
---@param sec_code string
---@return qluaInstruments #Таблица "Инструменты"
function getSecurityInfo(class_code, sec_code) end

---@class fngetTradeDateReturn
---@field date string Торговая дата в виде строки "ДД.ММ.ГГГГ"
---@field year number Год
---@field month number Месяц
---@field day number День

---Функция возвращает дату текущей торговой сессии.
---@return fngetTradeDateReturn
function getTradeDate() end

---@class fngetQuoteLevel2BidOffer
---@field price string Цена покупки / продажи
---@field quantity string Количество в лотах

---@class fngetQuoteLevel2Return
---@field bid_count string Количество котировок покупки. При отсутствии спроса возвращается значение "0"
---@field offer_count string Количество котировок продажи. При отсутствии предложения возвращается значение "0"
---@field bid fngetQuoteLevel2BidOffer Котировки спроса (покупки). При отсутствии спроса возвращается пустая строка
---@field offer fngetQuoteLevel2BidOffer Котировки предложений (продажи). При отсутствии предложения возвращается пустая строка

---Функция предназначена для получения стакана по указанному классу и инструменту.
---@param class_code string
---@param sec_code string
---@return fngetQuoteLevel2Return
function getQuoteLevel2(class_code, sec_code) end

---@class fngetParamExReturn
---Тип данных параметра, используемый в таблице Текущие торги. Возможные значения: \
--- 1 - double; \
--- 2 - long; \
--- 3 - char; \
--- 4 - перечислимый тип; \
--- 5 - время; \
--- 6 - дата
---@field param_type string
---@field param_value string Значение параметра. Для param_type = 3 значение параметра равно "0", в остальных случаях – числовое представление. Для перечислимых типов значение равно порядковому значению перечисления
---@field param_image string Строковое значение параметра, аналогичное его представлению в таблице. В строковом представлении учитываются разделители разрядов, разделители целой и дробной части. Для перечислимых типов выводятся соответствующие им строковые значения
---Результат выполнения операции. Возможные значения: \
--- 0 - ошибка; \
--- 1 - параметр найден
---@field result string

---Функция предназначена для получения значений всех параметров биржевой информации из таблицы "Текущие торги". С помощью этой функции можно получить любое из значений Таблицы текущих торгов для заданных кодов класса и инструмента.
---@param class_code string Код класса
---@param sec_code string Код инструмента
---@param param_name string Код параметра
---@return fngetParamExReturn?
function getParamEx(class_code, sec_code, param_name) end

---Функция предназначена для получения значений всех параметров биржевой информации из Таблицы текущих торгов с возможностью в дальнейшем отказаться от получения определенных параметров, заказанных с помощью функции `ParamRequest`. Для отказа от получения какого-либо параметра воспользуйтесь функцией `CancelParamRequest`.
---@param class_code string Код класса
---@param sec_code string Код инструмента
---@param param_name string Код параметра
---@return fngetParamExReturn?
function getParamEx2(class_code, sec_code, param_name) end

---Функция предназначена для отправки транзакций в торговую систему. В случае ошибки обработки транзакции в терминале QUIK возвращает строку с диагностикой ошибки. В остальных случаях транзакция отправляется на сервер. \
--- \
---Результат транзакции можно получить, воспользовавшись функцией обратного вызова `OnTransReply`. \
--- \
---В качестве параметра принимает таблицу, в которой имена и значения полей соответствуют параметрам tri-файла, описанным в Руководстве пользователя QUIK, Раздел 6 "Совместная работа с другими приложениями" / "Формат .tri-файла с параметрами транзакций". \
--- \
---ВАЖНО! Для корректной обработки данных числовые значения (цена, количество, идентификатор транзакции и т.д.) должны передаваться в виде строковых значений.
---@param transaction table Таблица с параметрами транзакции
---@return string #Текст ошибки, если она случилась при обработке транзакции
function sendTransaction(transaction) end

---Функция предназначена для расчета максимально возможного количества лотов в заявке. \
--- \
---При заданном параметре `is_market=true`, необходимо передать параметр `price=0`, иначе будет рассчитано максимально возможное количество лотов в заявке по цене price.
---@param class_code string Код класса
---@param sec_code string Код инструмента
---@param client_code string Код клиента
---@param account string Счет депо
---@param price number Цена
---@param is_buy boolean Признак заявки на покупку ("true" – на покупку, иначе – на продажу)
---@param is_market? boolean Признак рыночной заявки ("true" – рыночная заявка, иначе – лимитированная). Необязательный параметр, значение по умолчанию: "false"
---@return number #QTY
---@return number #Комиссия
function CalcBuySell(class_code, sec_code, client_code, account, price, is_buy, is_market) end

---@class fngetPortfolioInfoReturn
---Признак использования схемы кредитования с контролем текущей стоимости активов. Возможные значения: \
--- - "МЛ" – используется схема ведения позиции по плечу, плечо рассчитано по значению Входящего лимита; \
--- - "МП" – используется схема ведения позиции по плечу, плечо указано явным образом; \
--- - "МОП" – используется схема ведения позиции лимит на открытую позицию; \
--- - "МД" – используется схема ведения позиции по дисконтам; \
--- - "C" – используется схема ведения позиций срочный рынок. Для клиентов срочного рынка без единой денежной позиции; \
--- - <пусто> – используется схема ведения позиции по лимитам Тип клиента
---@field is_leverage string
---@field in_assets string Оценка собственных средств клиента до начала торгов
---@field leverage string Плечо. Если не задано явно, то отношение Входящего лимита к Входящим активам
---@field open_limit string Оценка максимальной величины заемных средств до начала торгов
---@field val_short string Оценка стоимости коротких позиций. Значение всегда отрицательное
---@field val_long string Оценка стоимости длинных позиций
---@field val_long_margin string Оценка стоимости длинных позиций по маржинальным инструментам, принимаемым в обеспечение
---@field val_long_asset string Оценка стоимости длинных позиций по немаржинальным инструментам, принимаемым в обеспечение
---@field assets string Оценка собственных средств клиента по текущим позициям и ценам
---@field cur_leverage string Текущее плечо
---@field margin string Уровень маржи, в процентах
---@field lim_all string Текущая оценка максимальной величины заемных средств
---@field av_lim_all string Оценка величины заемных средств, доступных для дальнейшего открытия позиций
---@field locked_buy string Оценка стоимости активов в заявках на покупку
---@field locked_buy_margin string Оценка стоимости активов в заявках на покупку маржинальных инструментов, принимаемых в обеспечение
---@field locked_buy_asset string Оценка стоимости активов в заявках на покупку немаржинальных инструментов, принимаемых в обеспечение
---@field locked_sell string Оценка стоимости активов в заявках на продажу маржинальных инструментов
---@field locked_value_coef string Оценка стоимости активов в заявках на покупку немаржинальных инструментов
---@field in_all_assets string Оценка стоимости всех позиций клиента в ценах закрытия предыдущей торговой сессии, включая позиции по немаржинальным инструментам
---@field all_assets string Текущая оценка стоимости всех позиций клиента
---@field profit_loss string Абсолютная величина изменения стоимости всех позиций клиента
---@field rate_change string Относительная величина изменения стоимости всех позиций клиента
---@field lim_buy string Оценка денежных средств, доступных для покупки маржинальных инструментов
---@field lim_sell string Оценка стоимости маржинальных инструментов, доступных для продажи
---@field lim_non_margin string Оценка денежных средств, доступных для покупки немаржинальных инструментов
---@field lim_buy_asset string Оценка денежных средств, доступных для покупки инструментов, принимаемых в обеспечение
---@field val_short_net string Оценка стоимости коротких позиций. При расчете не используется коэффициент дисконтирования
---@field val_long_net string Оценка стоимости длинных позиций. При расчете не используется коэффициент дисконтирования
---@field total_money_bal string Сумма остатков по денежным средствам по всем лимитам, без учета средств, заблокированных под исполнение обязательств, выраженная в выбранной валюте расчета
---@field total_locked_money string Cумма заблокированных средств со всех денежных лимитов клиента, пересчитанная в валюту расчетов через кросс-курсы на сервере
---@field haircuts string Сумма дисконтов стоимости длинных (только по инструментам обеспечения) и коротких позиций по инструментам, дисконтов корреляции между инструментами, а также дисконтов на задолженности по валютам, не покрытые обеспечением по инструментам в этих же валютах
---@field assets_without_hc string Суммарная величина денежных остатков, стоимости длинных позиций по инструментам обеспечения и стоимости коротких позиций, без учета дисконтирующих коэффициентов, без учета неттинга стоимости инструментов в рамках объединенной позиции по инструментам и без учета корреляции между инструментами
---@field status_coef string Отношение суммы дисконтов к текущим активам без учета дисконтов
---@field varmargin string Текущая вариационная маржа по позициям клиента, по всем инструментам
---@field go_for_positions string Размер денежных средств, уплаченных под все открытые позиции на срочном рынке
---@field go_for_orders string Оценка стоимости активов в заявках на срочном рынке
---@field rate_futures string Отношение ликвидационной стоимости портфеля к ГО по срочному рынку
---@field is_qual_client string Признак "квалифицированного" клиента, которому разрешено кредитование заемными средствами с плечом 1:3. Возможные значения: "ПовышУрРиска" – квалифицированный, <пусто> – нет
---@field is_futures string Счет клиента на FORTS, в случае наличия объединенной позиции, иначе поле остается пустым
---@field curr_tag string Актуальные текущие параметры расчета для данной строки в формате "<Валюта>-<Код позиции>". Пример: "SUR-EQTV"
---@field init_margin string Значение начальной маржи. Заполняется для клиентов типа "МД"
---@field min_margin string Значение минимальной маржи. Заполняется для клиентов типа "МД"
---@field corrected_margin string Значение скорректированной маржи. Заполняется для клиентов типа "МД"
---@field client_type string Тип клиента
---@field portfolio_value string Стоимость портфеля. Для клиентов типа "МД" возвращается значение для строк с максимальным сроком расчетов limit_kind
---@field start_limit_open_pos string Лимит открытых позиций на начало дня
---@field total_limit_open_pos string Лимит открытых позиций
---@field limit_open_pos string Планируемые чистые позиции
---@field used_lim_open_pos string Текущие чистые позиции
---@field acc_var_margin string Накопленная вариационная маржа
---@field cl_var_margin string Вариационная маржа по итогам промклиринга
---@field opt_liquid_cost string Ликвидационная стоимость опционов
---@field fut_asset string Сумма оценки средств клиента на срочном рынке
---@field fut_total_asset string Сумма оценки собственных средств клиента на фондовом и срочном рынках
---@field fut_debt string Текущая задолженность на срочном рынке
---@field fut_rate_asset string Достаточность средств
---@field fut_rate_asset_open string Достаточность средств (под открытые позиции)
---@field fut_rate_go string Коэффициент ликвидности ГО
---@field planed_rate_go string Ожидаемый коэффициент ликвидности ГО
---@field cash_leverage string Cash Leverage
---@field fut_position_type string Тип позиции на срочном рынке. Возможные значения "0" – нет позиции; "1" – фьючерсы; "2" – опционы; "3" – фьючерсы и опционы
---@field fut_accured_int string Накопленный доход с учетом премии по опционам и биржевым сборам
---@field rcv1 string Норматив покрытия риска 1. Рассчитывается как разница параметров "Стоимость портфеля" и "Начальная маржа". Для клиентов типа "МД" и "МД+"
---@field rcv2 string Норматив покрытия риска 2. Рассчитывается как разница параметров "Стоимость портфеля" и "Минимальная маржа". Для клиентов типа "МД" и "МД+"
---@field demand string Требование, если стоимость портфеля меньше стоимости начальной маржи, то считается как разность начальной маржи и портфеля, иначе "0". Заполняется для клиентов типа "МД"
---@field current_bal string Сумма текущих остатков с денежных лимитов клиента
---@field open_pos string Оценка открытых позиций клиента с учетом активных заявок. Заполняется для клиентов типа "МП"
---@field money_locked string Сумма блокировок по активным заявкам с денежных лимитов
---@field is_marginal string "1" для клиентов типа "МЛ" (тип кредитования "по лимитам")
---@field fundslevel string Уровень достаточности средств (УДС). Рассчитывается только для клиентов типа "МД" и "МД+", в остальных случаях принимает значение "9.99"

---Функция предназначена для получения значений параметров таблицы "Клиентский портфель", соответствующих идентификатору участника торгов `firm_id`, коду клиента `client_code` и сроку расчётов `limit_kind` со значением 0.
---@param firm_id string
---@param client_code string
---@return fngetPortfolioInfoReturn
function getPortfolioInfo(firm_id, client_code) end

---Функция предназначена для получения значений параметров таблицы "Клиентский портфель", соответствующих идентификатору участника торгов `firm_id`, коду клиента `client_code` и сроку расчётов `limit_kind` со значением, заданным пользователем. \
--- \
---Необязательные аргументы код позиции `board_tag` и валюта `currency` задают параметры расчета таблицы "Клиентский портфель", при их отсутствии используются код позиции и валюта по умолчанию для указанного участника торгов (`firm_id`). При этом в таблице с результатом в поле `curr_tag` заполняются параметры, для которых был выполнен расчет в формате "<Валюта> - <Код позиции>". \
--- \
---Для получения значений параметров таблицы "Клиентский портфель" для клиентов срочного рынка без единой денежной позиции необходимо указать в качестве `client_code` – торговый счет на срочном рынке, а в качестве `limit_kind` – 0.
---@param firm_id string
---@param client_code string
---@param limit_kind number
---@param board_tag? string
---@param currency? string
---@return fngetPortfolioInfoReturn
function getPortfolioInfoEx(firm_id, client_code, limit_kind, board_tag, currency) end

---@class fngetBuySellInfoReturn
---@field is_margin_sec string Признак маржинальности инструмента. Возможные значения: "0" – не маржинальная; "1" – маржинальная.
---@field is_asset_sec string Принадлежность инструмента к списку инструментов, принимаемых в обеспечение. Возможные значения: "0" – не принимается в обеспечение; "1" – принимается в обеспечение.
---@field balance string Текущая позиция по инструменту, в лотах
---@field can_buy string Оценка количества лотов, доступных на покупку по указанной цене *
---@field can_sell string Оценка количества лотов, доступных на продажу по указанной цене *
---@field position_valuation string Денежная оценка позиции по инструменту по ценам спроса/предложения
---@field value string Оценка стоимости позиции по цене последней сделки
---@field open_value string Оценка стоимости позиции клиента, рассчитанная по цене закрытия предыдущей торговой сессии
---@field lim_long string Предельный размер позиции по данному инструменту, принимаемый в обеспечение длинных позиций
---@field long_coef string Коэффициент дисконтирования, применяемый для длинных позиций по данному инструменту
---@field lim_short string Предельный размер короткой позиции по данному инструменту
---@field short_coef string Коэффициент дисконтирования, применяемый для коротких позиций по данному инструменту
---@field value_coef string Оценка стоимости позиции по цене последней сделки, с учетом дисконтирующих коэффициентов
---@field open_value_coef string Оценка стоимости позиции клиента, рассчитанная по цене закрытия предыдущей торговой сессии с учетом дисконтирующих коэффициентов
---@field share string Процентное отношение стоимости позиции по данному инструменту к стоимости всех активов клиента, рассчитанное по текущим ценам
---@field short_wa_price string Средневзвешенная стоимость коротких позиций по инструментам
---@field long_wa_price string Средневзвешенная стоимость длинных позиций по инструментам
---@field profit_loss string Разница между средневзвешенной ценой приобретения инструментов и их рыночной оценки
---@field spread_hc string Коэффициент корреляции между инструментами
---@field can_buy_own string Максимально возможное количество инструментов в заявке на покупку этого инструмента на этом классе на собственные средства клиента, исходя из цены лучшего предложения
---@field can_sell_own string Максимально возможное количество инструментов в заявке на продажу этого инструмента на этом классе из собственных активов клиента, исходя из цены лучшего спроса

---Функция возвращает таблицу Lua с параметрами из таблицы QUIK "Купить/Продать", означающими возможность купить либо продать указанный инструмент "sec_code" класса "class_code", указанным клиентом "client_code" фирмы "firmid", по указанной цене "price". Если цена равна "0", то используются лучшие значения спроса/предложения.
---@param firm_id string
---@param client_code string
---@param class_code string
---@param sec_code string
---@param price number
---@return fngetBuySellInfoReturn
function getBuySellInfo(firm_id, client_code, class_code, sec_code, price) end

---@class fngetBuySellInfoExReturn : fngetBuySellInfoReturn
---@field limit_kind number Срок расчётов. Возможные значения: положительные целые числа, начиная с 0, соответствующие срокам расчётов из таблицы "Позиции по инструментам": 0 – T0, 1 – T1, 2 – T2 и т.д.
---@field d_long string Эффективный начальный дисконт для длинной позиции. Заполняется для клиентов типа "МД"
---@field d_min_long string Эффективный минимальный дисконт для длинной позиции. Заполняется для клиентов типа "МД"
---@field d_short string Эффективный начальный дисконт для короткой позиции. Заполняется для клиентов типа "МД"
---@field d_min_short string Эффективный минимальный дисконт для короткой позиции. Заполняется для клиентов типа "МД"
---Тип клиента. Возможные значения: \
--- - "1" – "МЛ"; \
--- - "2" – "МП"; \
--- - "3" – "МОП"; \
--- - "4" – "МД"
---@field client_type string
---Признак того, является ли инструмент разрешенным для покупки на заемные средства. Возможные значения: \
--- "0" – не разрешен; \
--- "1" – разрешен \
---Заполняется для клиентов типа "МД"
---@field is_long_allowed string
---Признак того, является ли инструмент  разрешенным для продажи на заемные средства. Возможные значения: \
--- "0" – не разрешен; \
--- "1" – разрешен \
---Заполняется для клиентов типа "МД"
---@field is_short_allowed string

---Функция возвращает таблицу Lua с параметрами из таблицы QUIK "Купить/Продать", означающими возможность купить либо продать указанный инструмент "sec_code" класса "class_code", указанным клиентом "client_code" фирмы "firmid", по указанной цене "price". Если цена равна "0", то используются лучшие значения спроса/предложения.
---@param firm_id string
---@param client_code string
---@param class_code string
---@param sec_code string
---@param price number
---@return fngetBuySellInfoExReturn
function getBuySellInfoEx(firm_id, client_code, class_code, sec_code, price) end

--#endregion

--#region Функции получения информации по единой денежной позиции

---Функция возвращает торговый счет срочного рынка, соответствующий коду клиента фондового рынка с единой денежной позицией.
---@param firmid string Идентификатор фирмы фондового рынка
---@param client_code string Код клиента
---@return string?
function getTrdAccByClientCode(firmid, client_code) end

---Функция возвращает код клиента фондового рынка с единой денежной позицией, соответствующий торговому счету срочного рынка.
---@param firmid string Идентификатор фирмы фондового рынка
---@param trdaccid string Торговый счет срочного рынка
---@return string?
function getClientCodeByTrdAcc(firmid, trdaccid) end

---Функция предназначена для получения признака, указывающего имеет ли клиент единую денежную позицию.
---@param firmid string Идентификатор фирмы фондового рынка
---@param client string Кода клиента фондового рынка или торговый счет срочного рынка
---@return boolean
function isUcpClient(firmid, client) end

--#endregion

--#region Функции для работы с графиками

---Функция предназначена для получения количества линий в графике (индикаторе) по выбранному идентификатору.
---@param tag string
---@return number
function getLinesCount(tag) end

---Функция предназначена для получения информации о количестве свечек по выбранному идентификатору.
---@param tag string
---@return number
function getNumCandles(tag) end

---Функция предназначена для получения информации о свечках по идентификатору (заказ данных для построения графика плагин не осуществляет, поэтому для успешного доступа нужный график должен быть открыт).
---@param tag string Строковый идентификатор графика или индикатора
---@param line number Номер линии графика или индикатора. Первая линия имеет номер 0
---@param first_candle number Индекс первой свечки. Первая (самая левая) свечка имеет индекс 0
---@param count number Количество запрашиваемых свечек
---@return table #Таблица, содержащая запрашиваемые свечки
---@return number #Количество свечек в таблице
---@return string #Легенда (подпись) графика
function getCandlesByIndex(tag, line, first_candle, count) end

--- Тиковые данные
INTERVAL_TICK = 0
--- 1 минута
INTERVAL_M1 = 1
--- 2 минуты
INTERVAL_M2 = 2
--- 3 минуты
INTERVAL_M3 = 3
--- 4 минуты
INTERVAL_M4 = 4
--- 5 минут
INTERVAL_M5 = 5
--- 6 минут
INTERVAL_M6 = 6
--- 10 минут
INTERVAL_M10 = 10
--- 15 минут
INTERVAL_M15 = 15
--- 20 минут
INTERVAL_M20 = 20
--- 30 минут
INTERVAL_M30 = 30
--- 1 час
INTERVAL_H1 = 60
--- 2 часа
INTERVAL_H2 = 120
--- 4 часа
INTERVAL_H4 = 240
--- 1 день
INTERVAL_D1 = 1440
--- 1 неделя
INTERVAL_W1 = 10080
--- 1 месяц
INTERVAL_MN1 = 23200

---@class fnCreateDataSourceReturn
fnCreateDataSourceReturn = {}

---Функция предназначена для создания таблицы Lua и позволяет работать со свечками, полученными с сервера QUIK, а также реагировать на их изменение. \
--- \
---Функцию `CreateDataSource` можно использовать только внутри функций `main()` и `callback`.
---@param class_code string Код класса
---@param sec_code string Код инструмента
---@param interval number Интервал запрашиваемого графика
---@param param? string Необязательный параметр. Если параметр не задан, то заказываются данные на основании таблицы обезличенных сделок, если задан – данные по этому параметру.
---@return fnCreateDataSourceReturn? #Возвращает таблицу в случае успешного завершения. Если указан неверный код класса, код инструмента, интервал или параметр, то возвращается `nil`.
---@return string #Описание ошибки
function CreateDataSource(class_code, sec_code, interval, param) end

---@param callback_function function call_back(index)
---@return boolean
function fnCreateDataSourceReturn:SetUpdateCallback(callback_function) end

---Open
---@param index number Индексы свечек начинаются с 1
---@return number
function fnCreateDataSourceReturn:O(index) end

---High
---@param index number Индексы свечек начинаются с 1
---@return number
function fnCreateDataSourceReturn:H(index) end

---Low
---@param index number Индексы свечек начинаются с 1
---@return number
function fnCreateDataSourceReturn:L(index) end

---Close
---@param index number Индексы свечек начинаются с 1
---@return number
function fnCreateDataSourceReturn:C(index) end

---Volume
---@param index number Индексы свечек начинаются с 1
---@return number
function fnCreateDataSourceReturn:V(index) end

---@class fnCreateDataSourceReturnTime : qluaDateTime
---@field count number Количество тиковых интервалов в секунду. Может принимать значения от 1 до 10000 включительно.

---Time
---@param index number Индексы свечек начинаются с 1
---@return fnCreateDataSourceReturnTime
function fnCreateDataSourceReturn:T(index) end

---Функция возвращает текущее количество свечек в источнике данных.
---@return number
function fnCreateDataSourceReturn:Size() end

---Функция закрывает источник данных, и терминал прекращает получать данные с сервера.
---@return boolean
function fnCreateDataSourceReturn:Close() end

---Функция позволяет получать данные с сервера.
---@return boolean
function fnCreateDataSourceReturn:SetEmptyCallback() end

--#endregion

--#region Функции для работы с таблицами Рабочего места QUIK

--- Целое число
QTABLE_INT_TYPE = 1
--- Число с плавающей точкой
QTABLE_DOUBLE_TYPE = 2
--- Строка
QTABLE_STRING_TYPE = 3
--- 64-битное целое число
QTABLE_INT64_TYPE = 4
--- Кэшируемая строка
QTABLE_CACHED_STRING_TYPE = 6
--- Время
QTABLE_TIME_TYPE = 7
--- Дата
QTABLE_DATE_TYPE = 8

---Функция добавляет колонки в таблицу с идентификатором `t_id`.
---@param t_id number
---@param iCode number Код параметра, выводимого в колонке
---@param name string Название колонки
---@param is_default? boolean Параметр не используется
---@param par_type number Тип данных в колонке, одна из констант QTABLE_*_TYPE
---@param width number Ширина в условных единицах
---@return number #Функция возвращает 1, если колонка в таблицу добавлена, иначе – 0.
function AddColumn(t_id, iCode, name, is_default, par_type, width) end

---Функция создает структуру, описывающую таблицу. Функция возвращает целочисленный идентификатор таблицы, предназначенный для совершения с ней дальнейших операций.
---@return number
function AllocTable() end

---Функция удаляет содержимое таблицы с идентификатором `t_id`.
---@param t_id number
---@return boolean
function Clear(t_id) end

---Функция создает окно таблицы с идентификатором `t_id`.
---@param t_id number
---@return number #Функция возвращает 1 при успешном создании окна, иначе – 0.
function CreateWindow(t_id) end

---Функция удаления строки с ключом `key` из таблицы с идентификатором `t_id`.
---@param t_id number
---@param key number
---@return boolean
function DeleteRow(t_id, key) end

---Функция закрывает окно таблицы с идентификатором `t_id`. Все данные для отображения при закрытии окна удаляются.
---@param t_id number
---@return boolean
function DestroyTable(t_id) end

---Функция добавляет строку с ключом `key` в таблицу с идентификатором `t_id`. Добавление строк возможно только в созданное окно таблицы, после вызова функции `CreateWindow`. \
--- \
---При добавлении данных в новую таблицу в первую очередь выполните данную функцию с параметром `key` равным "-1". При этом строка добавится в конец таблицы. \
--- \
---При вызове функции с параметром `key` большим, чем текущее количество строк, строка добавляется в конец таблицы.
---@param t_id number
---@param key number
---@return number #Функция возвращает номер добавленной строки при успешном выполнении, иначе – "-1".
function InsertRow(t_id, key) end

---Функция предназначена для определения состояния окна таблицы `t_id`. Окно может быть открыто повторно с помощью функции `CreateWindow`. \
--- \
---Вызов `IsWindowClosed` внутри функции обратного вызова, заданной с помощью `SetTableNotificationCallback()`, всегда вернет "false".
---@param t_id number
---@return boolean? #"nil" – если таблица `t_id` не существует
function IsWindowClosed(t_id) end

---@class fnGetCellReturn
---@field image string Строковое представление значения в ячейке
---@field value number Числовое значение ячейки

---Функция возвращает таблицу, содержащую данные из ячейки в строке с ключом `key`, кодом колонки "code" в таблице `t_id`.
---@param t_id number
---@param key number
---@param code number
---@return fnGetCellReturn?
function GetCell(t_id, key, code) end

---Функция возвращает количество строк "rows" и столбцов "col" в таблице с индексом `t_id`. \
--- \
---Пользовательские фильтры, установленные на таблице, не влияют на возвращаемое количество строк. Заголовки строк и первый фиксированный столбец не учитываются в возвращаемых значениях.
---@param t_id number
---@return number rows
---@return number colums
function GetTableSize(t_id) end

---Функция получает текущий заголовок окна.
---@param t_id number
---@return string?
function GetWindowCaption(t_id) end

---Функция возвращает координаты верхнего левого и нижнего правого угла окна, содержащего таблицу `t_id`. \
--- \
---Функция возвращает `nil` в случае неуспешного завершения.
---@param t_id number
---@return number top
---@return number left
---@return number bottom
---@return number right
function GetWindowRect(t_id) end

---Функция для подсветки выбранного диапазона ячеек цветом фона и цветом текста в течении указанного времени с плавным "затуханием" для таблицы с идентификатором `t_id`. \
--- \
---Для отмены подсветки вызовите функцию с параметром `timeout=0`. При этом параметры `b_color` и `f_color` могут содержать любые значения. \
--- \
---Варианты подсветки ячеек в таблице аналогичны вариантам установки цвета, приведенным в описании функции `SetColor`.
---@param t_id number
---@param row number
---@param col number
---@param b_color number Цвет фона
---@param f_color number Цвет текста
---@param timeout number Время подсветки, в миллисекундах
---@return boolean
function Highlight(t_id, row, col, b_color, f_color, timeout) end

---Функция преобразовывает компоненты `RGB(red, green, blue)` в одно число для дальнейшего использования в функции `SetColor`.
---@param red number
---@param green number
---@param blue number
---@return number
function RGB(red, green, blue) end

---Функция задает значение для ячейки в строке с ключом `key`, кодом колонки "code" в таблице `t_id`. \
--- \
---Параметр `text` задает строковое представление значение параметра `value`. Параметр `value` необязательный и по умолчанию равен "0". Для столбцов со строковыми типами данных параметр `value` не задается. \
--- \
---Если параметр `value` не задан для ячеек всех остальных типов, то по столбцам, содержащим такие ячейки, не будет корректно работать сортировка, фильтрация и условное форматирование (см. Приложение 2).
---@param t_id number
---@param key number
---@param code number
---@param text string
---@param value number
---@return boolean
function SetCell(t_id, key, code, text, value) end

QTABLE_DEFAULT_COLOR = -1
QTABLE_NO_INDEX = -1

---Функция устанавливает цвет ячейки, столбца или строки для таблицы с идентификатором `t_id`. \
--- \
---В зависимости от переданных параметров `row` и `col` можно менять цвет всей таблицы, столбца, строки и отдельной ячейки. \
--- \
---Если в качестве цвета задана константа `QTABLE_DEFAULT_COLOR`, то используется цвет, заданный в цветовой схеме операционной системе Windows. При работе функции используется константа `QTABLE_NO_INDEX`, равная "-1".
---@param t_id number
---@param row number
---@param col number
---@param b_color number Цвет фона
---@param f_color number Цвет текста
---@param sel_b_color number Цвет фона выделенной ячейки
---@param sel_f_color number Цвет текста выделенной ячейки
---@return boolean
function SetColor(t_id, row, col, b_color, f_color, sel_b_color, sel_f_color) end

--- Нажата левая кнопка мыши, при этом par1 содержит номер строки, par2 - номер колонки
QTABLE_LBUTTONDOWN = 1
--- Нажата правая кнопка мыши, при этом par1 содержит номер строки, par2 - номер колонки
QTABLE_RBUTTONDOWN = 2
--- Двойное нажатие левой кнопки мыши, при этом par1 содержит номер строки, par2 - номер колонки
QTABLE_LBUTTONDBLCLK = 3
--- Двойное нажатие правой кнопки мыши, при этом par1 содержит номер строки, par2 - номер колонки
QTABLE_RBUTTONDBLCLK = 4
--- Изменение текущей (выделенной) строки, при этом par1 равен номеру новой выделенной строки
QTABLE_SELCHANGED = 5
--- Нажата символьная клавиша, при этом par2 содержит код клавиши, par1 - текущую выделенную строку
QTABLE_CHAR = 6
--- Нажата клавиша, при этом par2 содержит код клавиши, par1 - текущую выделенную строку
QTABLE_VKEY = 7
--- Нажата вниз средняя кнопка мыши, при этом par1 содержит номер строки, par2 - номер колонки
QTABLE_MBUTTONDOWN = 9
--- Двойное нажатие средней кнопки мыши, при этом par1 содержит номер строки, par2 - номер колонки
QTABLE_MBUTTONDBLCLK = 10
--- Отпущена левая кнопка мыши, при этом par1 содержит номер строки, par2 - номер колонки
QTABLE_LBUTTONUP = 11
--- Отпущена правая кнопка мыши, при этом par1 содержит номер строки, par2 - номер колонки
QTABLE_RBUTTONUP = 12
--- Закрытие таблицы, при этом par1 и par2 равны нулю
QTABLE_CLOSE = 24

---Задание функции обратного вызова для обработки событий в таблице. \
--- \
---ВАЖНО! Недопустим вызов функций `Clear` и `DestroyTable` для `t_id` внутри функции обратного вызова `f_cb`, назначенной на таблицу с данным `t_id`.
---@param t_id number Идентификатор таблицы
---@param f_cb function Функция обратного вызова для обработки событий в таблице
---@return number #В случае успешного завершения функция возвращает 1, иначе – 0
function SetTableNotificationCallback(t_id, f_cb) end

---Функция задает новый заголовок окна.
---@param t_id number
---@param str string
---@return boolean
function SetWindowCaption(t_id, str) end

---Функция устанавливает положение окна с таблицей `t_id`. Левый верхний угол в координаты x,y и размеры в dx, dy.
---@param t_id number
---@param x number
---@param y number
---@param dx number
---@param dy number
---@return boolean
function SetWindowPos(t_id, x, y, dx, dy) end

---Функция выделяет определенную строку таблицы. Функция работает с видимым представлением таблицы, в котором учитываются пользовательские фильтры и сортировка. \
--- \
---Если задано значение `row=-1`, то выделяется последняя видимая строка в таблице.
---@param table_id number Идентификатор таблицы
---@param row number Номер строки
---@return number #В случае успешного завершения функция возвращает номер выделенной строки, иначе – "-1".
function SetSelectedRow(table_id, row) end

--#endregion

--#region Функции для работы с метками

---@class fnAddLabelParams
---@field TEXT string Подпись метки (если подпись не требуется, то пустая строка)
---@field IMAGE_PATH string Путь к картинке, которая будет отображаться в качестве метки (пустая строка, если картинка не требуется). Используются картинки формата *.bmp, *.jpeg
---@field ALIGNMENT string Расположение картинки относительно текста (возможно 4 варианта: LEFT, RIGHT, TOP, BOTTOM)
---@field YVALUE number Значение параметра на оси Y, к которому будет привязана метка
---@field DATE number Дата в формате "ГГГГММДД", к которой привязана метка
---@field TIME number Время в формате "ЧЧММСС", к которому будет привязана метка
---@field R number Красная компонента цвета в формате RGB. Число в интервале [0;255]
---@field G number Зеленая компонента цвета в формате RGB. Число в интервале [0;255]
---@field B number Синяя компонента цвета в формате RGB. Число в интервале [0;255]
---@field TRANSPARENCY number Прозрачность метки в процентах. Значение должно быть в промежутке [0;100]
---@field TRANSPARENT_BACKGROUND number Прозрачность фона картинки. Возможные значения: 0 – прозрачность отключена, 1 – прозрачность включена
---@field FONT_FACE_NAME string Название шрифта (например "Arial")
---@field FONT_HEIGHT number Размер шрифта
---@field HINT string Текст всплывающей подсказки

---Добавляет метку с заданными параметрами.
---@param chart_tag string
---@param label_params fnAddLabelParams Таблица с параметрами метки
---@return number? #Функция возвращает числовой идентификатор метки. В случае неуспешного завершения функция возвращает `nil`.
function AddLabel(chart_tag, label_params) end

---Удаляет метку с заданными параметрами.
---@param chart_tag string Тег графика, к которому привязывается метка
---@param label_id number Идентификатор метки
---@return boolean
function DelLabel(chart_tag, label_id) end

---Команда удаляет все метки на диаграмме с указанным графиком.
---@param chart_tag string Тег графика, к которому привязывается метка
---@return boolean
function DelAllLabels(chart_tag) end

---@class fnGetLabelParamsReturn
---@field text string Подпись метки (если подпись не требуется, то пустая строка)
---@field image_path string Путь к картинке, которая будет отображаться в качестве метки (пустая строка, если картинка не требуется). Используются картинки формата *.bmp, *.jpeg
---@field alignment string Расположение картинки относительно текста (возможно 4 варианта: LEFT, RIGHT, TOP, BOTTOM)
---@field yvalue string Значение параметра на оси Y, к которому будет привязана метка
---@field date string Дата в формате "ГГГГММДД", к которой привязана метка
---@field time string Время в формате "ЧЧММСС", к которому будет привязана метка
---@field r string Красная компонента цвета в формате RGB. Число в интервале [0;255]
---@field g string Зеленая компонента цвета в формате RGB. Число в интервале [0;255]
---@field b string Синяя компонента цвета в формате RGB. Число в интервале [0;255]
---@field transparency string Прозрачность метки в процентах. Значение должно быть в промежутке [0;100]
---@field transparent_background string Прозрачность фона картинки. Возможные значения: 0 – прозрачность отключена, 1 – прозрачность включена
---@field font_face_name string Название шрифта (например "Arial")
---@field font_height string Размер шрифта
---@field hint string Текст всплывающей подсказки

---Команда позволяет получить параметры метки.
---@param chart_tag string Тег графика, к которому привязывается метка
---@param label_id number Идентификатор метки
---@return fnGetLabelParamsReturn? #Функция возвращает таблицу с параметрами метки. В случае неуспешного завершения функция возвращает `nil`.
function GetLabelParams(chart_tag, label_id) end

---Функция задает параметры для метки с указанным идентификатором.
---@param chart_tag string Тег графика, к которому привязывается метка
---@param label_id number Идентификатор метки
---@param params fnAddLabelParams Таблица с новыми параметрами метки
---@return boolean
function SetLabelParams(chart_tag, label_id, params) end

--#endregion

--#region Функции для заказа стакана котировок

---Функция заказывает на сервер получение стакана по указанному классу и инструменту.
---@param class_code string Код класса
---@param sec_code string Код инструмента
---@return boolean
function Subscribe_Level_II_Quotes(class_code, sec_code) end

---Функция отменяет заказ на получение с сервера стакана по указанному классу и инструменту.
---@param class_code string Код класса
---@param sec_code string Код инструмента
---@return boolean
function Unsubscribe_Level_II_Quotes(class_code, sec_code) end

---Функция позволяет узнать, заказан ли с сервера стакан по указанному классу и инструменту.
---@param class_code string Код класса
---@param sec_code string Код инструмента
---@return boolean
function IsSubscribed_Level_II_Quotes(class_code, sec_code) end

--#endregion

--#region Функции для заказа параметров Таблицы текущих торгов

---Функция заказывает получение параметров Таблицы текущих торгов. \
--- \
---Для корректной работы функции включите в настройках Рабочего места QUIK признак получения данных "Исходя из настроек открытых пользователем таблиц".
---@param class_code string Код класса
---@param sec_code string Код инструмента
---@param db_name string Код параметра
---@return boolean
function ParamRequest(class_code, sec_code, db_name) end

---Функция отменяет заказ на получение параметров Таблицы текущих торгов. \
--- \
---При использовании функций `ParamRequest()` и `CancelParamRequest()` отказ от заказанных параметров Таблицы текущих торгов возможен, если в скрипте используется функция `getParamEx2()`. \
--- \
---Если будет использоваться функция `getParamEx()`, то функция `CancelParamRequest()` не выполнит отмену получения параметров Таблицы текущих торгов.
--- \
---Для корректной работы функции включите в настройках Рабочего места QUIK признак получения данных "Исходя из настроек открытых пользователем таблиц".
---@param class_code string Код класса
---@param sec_code string Код инструмента
---@param db_name string Код параметра
---@return boolean
function CancelParamRequest(class_code, sec_code, db_name) end

--#endregion

--#region Функции и глобальные переменные скрипта индикатора

---Функция вызывается при добавлении индикатора на график (при нажатии кнопки "Добавить" в окне "Добавление графика"). Возвращает число, которое определяет количество линий в индикаторе. \
--- \
---Например, для индикатора "Аллигатор" функция возвращает значение "3". \
--- \
---Функция вызывается также при перезагрузке Рабочего места QUIK и при загрузке wnd-файла либо tab-файла, в которых сохранен график с индикатором.
---@return number
function Init() end

---Функция вызывается при поступлении новой или изменении существующей свечки в источнике данных для индикатора.
---@param index number Индекс свечки в источнике данных. Начинается с 1.
---@return number
---@return ...
function OnCalculate(index) end

---Функция вызывается при удалении индикатора с графика, либо при закрытии окна диаграммы и не является обязательной для индикатора.
function OnDestroy() end

---Функция вызывается при редактировании свойств индикатора после нажатия кнопок "Применить" или "OK". \
--- \
---Функция вызывается также при перезагрузке Рабочего места QUIK и при загрузке wnd-файла либо tab-файла, в которых сохранен график с индикатором.
function OnChangeSettings() end

---Open
---@param index number Индексы свечек начинаются с 1
---@return number
function O(index) end

---High
---@param index number Индексы свечек начинаются с 1
---@return number
function H(index) end

---Low
---@param index number Индексы свечек начинаются с 1
---@return number
function L(index) end

---Close
---@param index number Индексы свечек начинаются с 1
---@return number
function C(index) end

---Volume
---@param index number Индексы свечек начинаются с 1
---@return number
function V(index) end

---Time
---@param index number Индексы свечек начинаются с 1
---@return fnCreateDataSourceReturnTime
function T(index) end

---Функция возвращает текущее количество свечек в источнике данных.
---@return number
function Size() end

---Функция предназначена для проверки существования свечи на графике цены и объема. \
--- \
---Функция определяет свечи, которые не нужно учитывать в расчете индикатора. Такие свечи появляются в случае добавления на одну диаграмму с графиком цены и объема графика по истории значений параметра из Таблицы текущих торгов или при включенной настройке графика "Показывать пустые интервалы". Для таких свечей функции O, H, L, C, V возвращают `nil`, а функция T – время пустой свечи.
---@param index number Индекс свечи
---@return boolean
function CandleExist(index) end

---@class fngetDataSourceInfoReturn
---@field interval number Текущий интервал (тайм-фрейм) графика
---@field class_code string Код класса источника данных
---@field sec_code string Код инструмента источника данных
---@field param string Наименование параметра Таблицы текущих торгов, по которому строится график. Если поле пустое, то график строится на основании Таблицы обезличенных сделок

---Функция предназначена для получения информации об источнике данных для индикатора. \
--- \
---ВАЖНО! Для корректной работы функции `getDataSourceInfo`, вызываемой из функции `Init`, необходимо перезапустить Рабочее место QUIK после добавления индикатора на график.
---@return fngetDataSourceInfoReturn
function getDataSourceInfo() end

---Функция предназначена для установки указанного значения на выбранной линии определенной свечи индикатора.
---@param index number Индекс свечи. Нумерация начинается с 1
---@param line_number number Номер линии. Нумерация начинается с 1
---@param value? number Устанавливаемое значение. Параметр может иметь значение `nil`.
---@return boolean
function SetValue(index, line_number, value) end

---Функция предназначена для определения значения, установленного на выбранной линии указанной свечи индикатора.
---@param index number Индекс свечи. Нумерация начинается с 1
---@param line_number number Номер линии. Нумерация начинается с 1
---@return number? #Функция возвращает значение value, установленное для линии line_number свечи index. В случае ошибки функция возвращает `nil`.
function GetValue(index, line_number) end

---Функция предназначена для установки указанного значения на выбранной линии для определенного интервала индексов свечей индикатора. \
--- \
---Функция устанавливает значение `value` для линии `line_number` от индекса `start_index` до индекса `end_index` включительно.
---@param line_number number Номер линии
---@param start_index number Индекс начальной свечи интервала
---@param end_index number Индекс конечной свечи интервала
---@param value number Устанавливаемое значение
---@return boolean
function SetRangeValue(line_number, start_index, end_index, value) end

--- Линии
TYPE_LINE = 1
--- Гистограммы
TYPE_HISTOGRAM = 2
--- Свечи
TYPE_CANDLE = 3
--- Бары
TYPE_BAR = 4
--- Точки
TYPE_POINT = 5
--- Точка-тире
TYPE_DASHDOT = 6
--- Тире
TYPE_DASH = 7
--- Треугольник вверх
TYPE_TRIANGLE_UP = 10
--- Треугольник вниз
TYPE_TRIANGLE_DOWN = 11

--#endregion

--#region Потокобезопасные функции для работы с таблицами Lua

table.sconcat = table.concat

table.sremove = table.remove

table.sinsert = table.insert

table.ssort = table.sort

--#endregion

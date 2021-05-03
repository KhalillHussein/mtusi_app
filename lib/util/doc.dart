import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../providers/index.dart';

class Doc {
  Doc._();

  static final Doc doc = Doc._();

  String organizationText =
      'Северо-Кавказский филиал ордена Трудового Красного Знамени федерального Государственного бюджетного образовательного учреждения высшего образования "Московский технический университет связи и информатики"';

  List<Map> info = [
    {
      'name': 'Адрес',
      'desc': '344002, г.Ростов-на-Дону, ул.Серафимовича, 62.',
      'icon': MdiIcons.mapMarker,
      'url':
          'https://www.google.com/maps/place/Северо-Кавказский+Филиал+МТУСИ/@47.219186,39.712502,15z/data=!4m5!3m4!1s0x0:0xa80a645ed8e1ba37!8m2!3d47.219186!4d39.712502',
    },
    {
      'name': 'Телефон',
      'desc': '(863) 310-69-60',
      'icon': MdiIcons.phoneClassic,
      'url': 'tel:+7(863)3706960',
    },
    {
      'name': 'Факс',
      'desc': '(863) 310-69-68',
      'icon': MdiIcons.deskphone,
      'url': 'tel:+7(863)3106968',
    },
    {
      'name': 'Телекс',
      'desc': '123432 VOLT RU',
      'icon': MdiIcons.phoneVoip,
    },
    {
      'name': 'Email',
      'desc': 'mаil@skf-mtusi.ru',
      'icon': MdiIcons.at,
      'url': 'mailto:mаil@skf-mtusi.ru',
    },
    {
      'name': 'Instagram',
      'desc': '@skf_mtusi',
      'icon': MdiIcons.instagram,
      'url': 'https://www.instagram.com/skf_mtuci/'
    },
    {
      'name': 'График работы',
      'desc':
          'С понедельника по пятницу: с 8.00 до 22.00. Суббота с 8.00 до 14.00',
      'icon': MdiIcons.accountHardHat,
    },
    {
      'name': 'Перерыв',
      'desc': '13.00 до 14.00',
      'icon': MdiIcons.sofaSingleOutline
    },
    {
      'name': 'Посетителям',
      'desc':
          'ПН-ЧТ: с 09.00 до 11.00 и с 16.00 до 18.00. ПТ с 14.00 до 16.00. СБ с 10.00 до 12.00',
      'icon': MdiIcons.accountCheckOutline,
    }
  ];

  List<Map<String, dynamic>> inquiries = [
    {
      'department': 'Отдел кадров',
      'title': 'Федеральная Налоговая Служба (ИФНС)',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в ИФНС',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Управление пенсионного фонда Российской Федерации (УПФ РФ)',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в УПФ РФ',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Управление социальной защиты населения (УСЗН)',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в УСЗН',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Министерство внутренних дел Российской Федерации (МВД)',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в МВД',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Управление Федеральной миграционной службы России (УФМС)',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в УФМС',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Многофункциональный центр (МФЦ)',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в МФЦ',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Иные государственные учреждения',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в иные государственные учреждения',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Справка Приложение №2',
      'fullName':
          'Справка выдается под расписку учащимся для представления в военный комиссариат',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Об отчислении или переводе в другой ВУЗ',
      'fullName':
          'Копии и выписки из приказов об отчислении или переводе в другой ВУЗ',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Заверенная копия диплома и аттестата',
    },
    {
      'department': 'Деканат',
      'title': 'Справка с места учебы',
    },
    {
      'department': 'Деканат',
      'title': 'Справка - вызов',
    },
    {
      'department': 'Деканат',
      'title': 'Характеристика',
    },
  ];

  Uri emailForm({
    @required String group,
    @required String userName,
    @required String inquiry,
    @required String location,
    @required String phoneNumber,
    @required DocType docType,
  }) {
    String doc;
    switch (docType) {
      case DocType.eDoc:
        doc = 'Отправить копию справки.';
        break;
      case DocType.realDoc:
        doc = 'За оригиналом справки явлюсь лично.';
        break;
    }
    final body = """
Студент группы $group,
<br>
$userName запрашивает выдачу справки "$inquiry".
<br>
<br>
Учреждение располагается: "$location".
<br>
<br>
$doc
<br>
<br>
О готовности документа сообщить по телефону: +7 $phoneNumber.
""";
    return Uri(
        scheme: 'mailto',
        path: 'RusObeySwag@gmail.com',
        queryParameters: {
          'subject': 'Запрос на выдачу справки "$inquiry"',
          'body': body,
        });
  }

  List<Map<String, dynamic>> timing = [
    {
      'group': 'ДВ-11',
      'shift': '1',
      'first': ['08.00-08.45', '08.50-09.35'],
      'second': ['09.50-10.35', '10.40-11.25'],
      'third': ['11.40-12.25', '12.30-13.15'],
    },
    {
      'group': 'ДИ-11, ДИ-12',
      'shift': '1',
      'first': ['08.30-09.15', '09.20-10.05'],
      'second': ['10.20-11.05', '11.10-11.55'],
      'third': ['12.10-12.55', '13.00-13.45'],
    },
    {
      'group': 'ДВ-21',
      'shift': '1',
      'first': ['08.15-09.00', '09.05-09.50'],
      'second': ['10.05-10.50', '10.55-11.40'],
      'third': ['11.55-12.40', '12.45-13.30'],
    },
    {
      'group': 'ДИ-21, ДИ-22',
      'shift': '1',
      'first': ['08.45-09.30', '09.35-10.20'],
      'second': ['10.35-11.20', '11.25-12.10'],
      'third': ['12.25-13.10', '13.15-14.00'],
    },
    {
      'group': 'ДП-31',
      'shift': '2',
      'first': ['09.00-09.45', '09.50-10.35'],
      'second': ['10.50-11.35', '11.40-12.25'],
      'third': ['12.40-13.25', '13.30-14.15'],
      'four': ['14.00-14.45', '14.50-15.35'],
      'five': ['15.50-16.35', '16.40-17.25'],
      'six': ['17.40-18.25', '18.30-19.15'],
    },
    {
      'group': 'ДЗ-31, ДС-31',
      'shift': '2',
      'first': ['09.30-10.15', '10.20-11.05'],
      'second': ['11.20-12.05', '12.10-12.55'],
      'third': ['13.10-13.55', '14.00-14.45'],
      'four': ['14.30-15.15', '15.20-16.05'],
      'five': ['16.20-17.05', '17.10-17.55'],
      'six': ['18.10-18.55', '19.00-19.45'],
    },
    {
      'group': 'ДП-41',
      'shift': '2',
      'first': ['09.15-10.00', '10.05-10.50'],
      'second': ['11.05-11.50', '11.55-12.40'],
      'third': ['12.55-13.40', '13.45-14.30'],
      'four': ['14.15-15.00', '15.05-15.50'],
      'five': ['16.05-16.50', '16.55-17.40'],
      'six': ['17.55-18.40', '18.45-19.30'],
    },
    {
      'group': 'ДЗ-41',
      'shift': '2',
      'first': ['09.45-10.30', '10.35-11.20'],
      'second': ['11.35-12.20', '12.25-13.10'],
      'third': ['13.25-14.10', '14.15-15.00'],
      'four': ['14.45-15.30', '15.35-16.20'],
      'five': ['16.35-17.20', '17.25-18.10'],
      'six': ['18.25-19.10', '19.15-20.00'],
    }
  ];
}

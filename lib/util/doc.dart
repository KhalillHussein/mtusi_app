import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:mtusiapp/providers/radio.dart';

class Doc {
  Doc._();

  static final Doc doc = Doc._();

  static const organizationText =
      'Северо-Кавказский филиал ордена Трудового Красного Знамени федерального Государственного бюджетного образовательного учреждения высшего образования "Московский технический университет связи и информатики"';

  static const List<Map> info = [
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
          'Справки, подтверждающие факт обучения для представления в Федеральную Налоговую Службу (ИФНС)',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Управление пенсионного фонда Российской Федерации (УПФ РФ)',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в Управление пенсионного фонда Российской Федерации (УПФ РФ)',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Управление социальной защиты населения (УСЗН)',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в Управление социальной защиты населения (УСЗН)',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Министерство внутренних дел Российской Федерации (МВД)',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в Министерство внутренних дел Российской Федерации (МВД)',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Управление Федеральной миграционной службы России (УФМС)',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в Управление Федеральной миграционной службы России (УФМС)',
    },
    {
      'department': 'Отдел кадров',
      'title': 'Многофункциональный центр (МФЦ)',
      'fullName':
          'Справки, подтверждающие факт обучения для представления в Многофункциональный центр (МФЦ)',
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
          'Справка Приложение №2 (выдается под расписку учащимся для представления в военный комиссариат)',
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
О готовности документа сообщить по телефону: $phoneNumber.
""";
    return Uri(
        scheme: 'mailto',
        path: 'RusObeySwag@gmail.com',
        queryParameters: {
          'subject': 'Запрос на выдачу справки "$inquiry"',
          'body': body,
        });
  }
}

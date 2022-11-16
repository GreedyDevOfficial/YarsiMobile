import 'package:flutter/material.dart';
import 'package:yarsi/models/coin_exchange.dart';
import 'package:yarsi/models/coin_turnover.dart';
import 'package:yarsi/models/guild.dart';
import 'package:yarsi/models/models.dart';


final List<HashTag> hashTags = [
  HashTag(id: 1, title: 'غذای سرد'),
  HashTag(id: 2, title: 'غذای فصل'),
  HashTag(id: 3, title: 'غذای آماده'),
  HashTag(id: 4, title: 'غذای لذیذ'),
  HashTag(id: 5, title: 'غذای شمالی خانگی'),
  HashTag(id: 6, title: 'غذای فوری'),
];

final List<Message> messagesList = [
  Message(id: 1, messageTitle: 'واریز ۱۰۰ سکه به حساب شما', messageText: '', date: '1401/05/20', time: '12:45'),
  Message(id: 2, messageTitle: 'فروشگاه شما تایید شد', messageText: '', date: '1401/05/20', time: '12:45'),
  Message(id: 3, messageTitle: 'مدارک شما تایید نشده', messageText: '', date: '1401/05/20', time: '12:45'),
  Message(id: 4, messageTitle: 'درخواست شما انجام شد', messageText: '', date: '1401/05/20', time: '12:45'),
];

final List<Chat> chatList = [
  Chat(id: 1, lastChat: 'سلام در مورد تخفیف کالا سوالی داشتم', storeName: 'فروشگاه شفیعی', storeImageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80', date: '1401/05/25', time: '12:45'),
  Chat(id: 2, lastChat: 'سلام دوست گرامی بفرمایید', storeName: 'آلین لند', storeImageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80', date: '1401/05/23', time: '10:45'),
  Chat(id: 3, lastChat: 'بله شما می توانید با مراجعه حضوری از تخفیفات ما بهر مند شوید', storeName: 'آلین لند', storeImageUrl: 'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80', date: '1401/05/09', time: '16:25'),
];

final List<Conversation> conversationList = [
  Conversation(id: 1, conversationName: 'علی محمدی', conversationText: 'سلام در مورد کالای شما سوالی داشتم', profileImageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80', date: '1401/05/09', time: '16:25', senderType: 'user'),
  Conversation(id: 1, conversationName: 'آلین لند', conversationText: 'سلام دوست گرامی بله بفرمایید', profileImageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80', date: '1401/05/09', time: '18:10', senderType: 'store'),
  Conversation(id: 1, conversationName: 'آلین لند', conversationText: 'سلام دوست گرامی بله بفرمایید', profileImageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80', date: '1401/05/09', time: '18:10', senderType: 'store'),
  Conversation(id: 1, conversationName: 'آلین لند', conversationText: 'سلام دوست گرامی بله بفرمایید', profileImageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80', date: '1401/05/09', time: '18:10', senderType: 'store'),
  Conversation(id: 1, conversationName: 'آلین لند', conversationText: 'سلام دوست گرامی بله بفرمایید', profileImageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80', date: '1401/05/09', time: '18:10', senderType: 'store'),
  Conversation(id: 1, conversationName: 'آلین لند', conversationText: 'سلام دوست گرامی بله بفرمایید', profileImageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80', date: '1401/05/09', time: '18:10', senderType: 'store'),
  Conversation(id: 1, conversationName: 'آلین لند', conversationText: 'سلام دوست گرامی بله بفرمایید', profileImageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80', date: '1401/05/09', time: '18:10', senderType: 'store'),
  Conversation(id: 1, conversationName: 'آلین لند', conversationText: 'سلام دوست گرامی بله بفرمایید', profileImageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80', date: '1401/05/09', time: '18:10', senderType: 'store'),
];


final List<Bank> banks = [
  Bank(bankName: 'ملت', logo: 'assets/png/bank_mellat.png', color: const Color(0xFFEF6B6B)),
  Bank(bankName: 'ملی', logo: 'assets/png/bank_mellat.png', color: const Color(0xFF54FFAD)),
  Bank(bankName: 'سپه', logo: 'assets/png/bank_mellat.png', color: const Color(0xFF54CCFF)),
  Bank(bankName: 'سپه', logo: 'assets/png/bank_mellat.png', color: const Color(0xFFEF6B6B)),
  Bank(bankName: 'سپه', logo: 'assets/png/bank_mellat.png', color: const Color(0xFFEF6B6B)),
  Bank(bankName: 'سپه', logo: 'assets/png/bank_mellat.png', color: const Color(0xFFEF6B6B)),
  Bank(bankName: 'سپه', logo: 'assets/png/bank_mellat.png', color: const Color(0xFFEF6B6B)),
  Bank(bankName: 'سپه', logo: 'assets/png/bank_mellat.png', color: const Color(0xFFEF6B6B)),
];

final List<Guild> guilds = [
  Guild(id: 1, guildTitle: 'اغذیه و رستوران', Visibility: true),
  Guild(id: 2, guildTitle: 'لوازم خانگی', Visibility: true),
  Guild(id: 3, guildTitle: 'خودرو', Visibility: true),
  Guild(id: 4, guildTitle: 'تجهیزات الکترونیکی', Visibility: true),
  Guild(id: 5, guildTitle: 'سوپرمارکت', Visibility: true),
];


final List<Favorite> favorites = [
  Favorite(id: 1, name: "غدا و رستوران"),
  Favorite(id: 2, name: "آرایشی و بهداشتی"),
  Favorite(id: 3, name: "گردشگری"),
  Favorite(id: 4, name: "لوازم خانگی"),
  Favorite(id: 5, name: "سوپرمارکت"),
  Favorite(id: 6, name: "کالای دیجیتال"),
  Favorite(id: 7, name: "خودرو"),
];

final List<City> cities = [
  City(id: 1, name: "تهران"),
  City(id: 2, name: "مشهد"),
  City(id: 3, name: "اصفهان"),
  City(id: 4, name: "یزد"),
  City(id: 5, name: "شیراز"),
  City(id: 6, name: "فارس"),
  City(id: 7, name: "اردکان"),
  City(id: 8, name: "سمنان"),
  City(id: 9, name: "قزوین"),
  City(id: 10, name: "زنجان"),
];

final List<Quarter> quarters = [
  Quarter(id: 1, name: "امیرآباد"),
  Quarter(id: 2, name: "یوسف آباد"),
  Quarter(id: 3, name: "جنت آباد"),
  Quarter(id: 4, name: "دزاشیب"),
  Quarter(id: 5, name: "عباس آباد"),
  Quarter(id: 6, name: "منیریه"),
];

final List<CoinExchange> coinExchanges = [
  CoinExchange(date: '1400/02/05', amount:1500 , count: 15),
  CoinExchange(date: '1400/02/08', amount:1500 , count: 15),
  CoinExchange(date: '1400/02/15', amount:1500 , count: 15),
];


final List<CoinTurnover> coinTurnovers = [
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'مشاهده تبلیغات', desposite: true),
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'درخواست پول', desposite: false),
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'مشاهده تبلیغات', desposite: true),
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'مشاهده تبلیغات', desposite: true),
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'مشاهده تبلیغات', desposite: true),
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'مشاهده تبلیغات', desposite: true),
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'مشاهده تبلیغات', desposite: true),
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'مشاهده تبلیغات', desposite: true),
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'مشاهده تبلیغات', desposite: true),
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'مشاهده تبلیغات', desposite: true),
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'مشاهده تبلیغات', desposite: true),
  CoinTurnover(date: '1400/02/05', count: 15, descriptions: 'مشاهده تبلیغات', desposite: true),
];

final List<MoneyTurnover> moneyTurnovers = [
  MoneyTurnover(date: '1401/01/25', descriptions: 'واریز وجه', amount: 150000, desposite: true),
  MoneyTurnover(date: '1401/01/27', descriptions: 'درخواست پول', amount: 50000, desposite: false),
  MoneyTurnover(date: '1401/01/28', descriptions: 'تبدیل سکه به پول', amount: 15000, desposite: true),
  MoneyTurnover(date: '1401/01/29', descriptions: 'تبدیل سکه به پول', amount: 25000, desposite: true),
  MoneyTurnover(date: '1401/01/30', descriptions: 'تبدیل سکه به پول', amount: 18000, desposite: true),
];

final List<MoneyRequest> moneyRequests = [
  MoneyRequest(date: '1401/02/05', status: 'واریز شده', amount: 50000),
  MoneyRequest(date: '1401/02/15', status: 'در حال انجام', amount: 50000),
  MoneyRequest(date: '1401/02/25', status: 'در حال انجام', amount: 50000),
];

final reportPostOptions = [
  CheckBoxState('عکس های پست دارای مشکل هست', false),
  CheckBoxState('نظرات کاربران صحیح نمی باشد', false),
  CheckBoxState('اطلاعات این پست صحیح نمی باشد', false),
];
final List<Comment> comments = [
  Comment(
      userName: 'ali',
      profileUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      description: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است '
  ),
  Comment(
      userName: 'mohammad',
      profileUrl: 'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
      description: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.'
  ),
  Comment(
      userName: 'akram',
      profileUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
      description: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. کتابهای زیادی در شصت و سه درصد گذشته، حال و آینده شناخت فراوان جامعه و متخصصان را می طلبد تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی و فرهنگ پیشرو در زبان فارسی ایجاد کرد.'
  )
];

final User currentUser = User(
  name: 'کاربر آزمایشی',
  identity: 'user1',
  bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
  imageUrl:
  'https://images.unsplash.com/photo-1578133671540-edad0b3d689e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80',
);

final List<SuggestedStore> suggestedStores = [
  const SuggestedStore(
      id: 1,
      name: 'فروشگاه آرشام',
      imageUrl: 'https://images.unsplash.com/photo-1618641986557-1ecd230959aa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=3840&q=80'
  ),
  const SuggestedStore(
      id: 2,
      name: 'فروشگاه شفیعی',
      imageUrl: 'https://images.unsplash.com/photo-1474447976065-67d23accb1e3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=985&q=80'
  ),
  const SuggestedStore(
      id: 3,
      name: 'فروشگاه چهره نگار',
      imageUrl: 'https://images.unsplash.com/photo-1579783483458-83d02161294e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1397&q=80'
  ),
  const SuggestedStore(
      id: 4,
      name: 'فروشگاه هانت',
      imageUrl: 'https://images.unsplash.com/photo-1560250097-0b93528c311a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80'
  ),
  const SuggestedStore(
      id: 5,
      name: 'فروشگاه سعادت',
      imageUrl: 'https://images.unsplash.com/photo-1540569014015-19a7be504e3a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1035&q=80'
  ),
  const SuggestedStore(
      id: 6,
      name: 'فروشگاه شوبیز',
      imageUrl: 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2340&q=80'
  ),
];

final List<User> onlineUsers = [
  User(
    name: 'الهه محسنی',
    identity: 'mynewstore',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'علی احمدی',
    identity: 'user3',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'مجید بیات',
    identity: 'user4',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  User(
    name: 'جان اسمیت',
    identity: 'user5',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  User(
    name: 'محمد علوی',
    identity: 'user6',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  User(
    name: 'سعید محمودی',
    identity: 'user7',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'Paul Pinnock',
    identity: 'user8',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  User(
      name: 'الیزابت وانگ',
      identity: 'user9',
      bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
      imageUrl:
      'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  User(
    name: 'جیمز لتراب',
    identity: 'user10',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  User(
    name: 'جسین سمپسون',
    identity: 'user11',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'دیوید بروک',
    identity: 'user12',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'جین دوو',
    identity: 'user13',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'مث هینکل',
    identity: 'user14',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1492562080023-ab3db95bfbce?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1331&q=80',
  ),
  User(
    name: 'امی اسمیت',
    identity: 'user15',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1534528741775-53994a69daeb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=700&q=80',
  ),
  User(
    name: 'اد موریس',
    identity: 'user16',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1521119989659-a83eee488004?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=664&q=80',
  ),
  User(
    name: 'کارولین دونکن',
    identity: 'user17',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
  User(
    name: 'پاوول پینوک',
    identity: 'user18',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1519631128182-433895475ffe?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
  ),
  User(
      name: 'الیزابت وونگ',
      identity: 'user19',
      bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
      imageUrl:
      'https://images.unsplash.com/photo-1515077678510-ce3bdf418862?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjF9&auto=format&fit=crop&w=675&q=80'),
  User(
    name: 'جیمز لتراب',
    identity: 'user20',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1528892952291-009c663ce843?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=592&q=80',
  ),
  User(
    name: 'جسی سمسون',
    identity: 'user21',
    bio: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    imageUrl:
    'https://images.unsplash.com/photo-1517841905240-472988babdf9?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80',
  ),
];

final List<PostPhoto> postPhotos = [
  PostPhoto(
      id: 1,
      photoUrl: 'https://images.unsplash.com/photo-1534723452862-4c874018d66d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=80',
      display: true
  ),
  PostPhoto(
      id: 2,
      photoUrl: 'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=80',
      display: true
  ),
  PostPhoto(
      id: 3,
      photoUrl: 'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=80',
      display: true
  ),
];

final List<Discount> discounts = [
  Discount(id: 1, postId: 1, discountCode: 'Y30-5645955786', discountPercentage: 10, discountCallbackLink: "", postImageUrl: "https://images.unsplash.com/photo-1534723452862-4c874018d66d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=80"),
  Discount(id: 2, postId: 1, discountCode: 'Y30-5463520053', discountPercentage: 15, discountCallbackLink: "", postImageUrl: "https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=80"),
  Discount(id: 3, postId: 1, discountCode: 'Y30-1123573210', discountPercentage: 7, discountCallbackLink: "", postImageUrl: "https://images.unsplash.com/photo-1462392246754-28dfa2df8e6b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=80"),
];

final List<Post> posts = [
  Post(
    id: 1,
    user: onlineUsers[9],
    caption: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.',
    timeAgo: '1d',
    imageUrl:
    'https://images.unsplash.com/photo-1534723452862-4c874018d66d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=80',
    likes: 1523,
    shares: 129,
    comments: 301,
    postType: 1,
    discountPercentage: 10,
    priceWithDiscount: 90000,
    priceWithoutDiscount: 100000,
    hasAffiliate: false,
    hasDiscount: true,
  ),
  Post(
    id: 2,
    user: currentUser,
    caption: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است.',
    timeAgo: '58m',
    imageUrl: 'https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=80',
    likes: 1202,
    comments: 184,
    shares: 96,
    postType: 1,
    discountPercentage: 10,
    priceWithDiscount: 90000,
    priceWithoutDiscount: 100000,
    hasAffiliate: true,
    hasDiscount: true,
  ),
  Post(
    id: 3,
    user: onlineUsers[5],
    caption:
    'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد.',
    timeAgo: '3hr',
    imageUrl: '',
    likes: 683,
    comments: 79,
    shares: 18,
    postType: 2,
    discountPercentage: 10,
    priceWithDiscount: 90000,
    priceWithoutDiscount: 100000,
    hasAffiliate: false,
    hasDiscount: true,
  ),
  Post(
    id: 4,
    user: onlineUsers[4],
    caption: 'لورم ایپسوم متن ساختگی با تولید سادگی',
    timeAgo: '8hr',
    imageUrl:
    'https://images.unsplash.com/photo-1462392246754-28dfa2df8e6b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=600&q=80',
    likes: 894,
    comments: 201,
    shares: 27,
    postType: 2,
    discountPercentage: 10,
    priceWithDiscount: 90000,
    priceWithoutDiscount: 100000,
    hasAffiliate: true,
    hasDiscount: true,
  ),
  Post(
    id: 5,
    user: onlineUsers[3],
    caption: 'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. ',
    timeAgo: '15hr',
    imageUrl:
    'https://images.unsplash.com/photo-1605217613423-0a61bd725c8a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=650&q=80',
    likes: 722,
    comments: 183,
    shares: 42,
    postType: 2,
    discountPercentage: 0,
    priceWithDiscount: 0,
    priceWithoutDiscount: 100000,
    hasAffiliate: false,
    hasDiscount: false,
  ),
  Post(
    id: 6,
    user: onlineUsers[0],
    caption:
    'لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. ',
    timeAgo: '1d',
    imageUrl: '',
    likes: 482,
    comments: 37,
    shares: 9,
    postType: 1,
    discountPercentage: 10,
    priceWithDiscount: 90000,
    priceWithoutDiscount: 100000,
    hasAffiliate: false,
    hasDiscount: true,
  ),

];

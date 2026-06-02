// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get titleSettingScreen => '设置';

  @override
  String get titleMainScreen => 'WiseWorkout';

  @override
  String get titleMaintenanceScreen => '维护';

  @override
  String get titleHistoryScreen => '历史';

  @override
  String get navigateToSettingScreen => '前往设置';

  @override
  String get navigateToMaintenanceScreen => '前往维护';

  @override
  String get navigateToHistoryScreen => '前往历史';

  @override
  String get navigateToMainScreen => '返回主页';

  @override
  String get buttonLoadPresets => '加载预设';

  @override
  String get buttonApplyConfiguration => '应用配置';

  @override
  String get buttonResetDatabase => '重置配置';

  @override
  String get buttonChoose => '选择';

  @override
  String get buttonCancel => '取消';

  @override
  String get buttonShowHistory => '查看历史';

  @override
  String get toastTextConfigurationSaved => '配置已保存';

  @override
  String get toastTextResetedDatabase => '配置已重置';

  @override
  String get titleSettingDescription => '管理您的设置';

  @override
  String get labelSettingWorkout => '运动';

  @override
  String get labelSettingRest => '休息';

  @override
  String get labelSettingSets => '组数';

  @override
  String get labelSettingSummarize => '总结';

  @override
  String get labelSettingOption => '选项';

  @override
  String get labelSettingUseCircularTimer => '使用环形计时器';

  @override
  String get labelSettingSoundActive => '声音开启';

  @override
  String textCountTime(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 次',
      one: '1 次',
      zero: '无时间',
    );
    return '$_temp0';
  }

  @override
  String get textSummarizeEndText => ' 本次训练结束。';

  @override
  String get drawerHeaderPreferences => '首选项';

  @override
  String get drawerHeaderTools => '工具';

  @override
  String get drawerHeaderSupport => '支持';

  @override
  String get drawerHeaderLegal => '法律';

  @override
  String get drawerMonthlySummaryText => '月度总结';

  @override
  String get drawerAboutUsText => '关于我们';

  @override
  String get drawerVersionInfoText => '版本信息';

  @override
  String get drawerAuthorizationText => '授权';

  @override
  String get drawerFeedbackText => '反馈';

  @override
  String get drawerRateOnStore => '在商店中评分';

  @override
  String get drawerPrivacyPolicy => '隐私政策';

  @override
  String get drawerTermsOfService => '服务条款';

  @override
  String get drawerReportABug => '报告错误';

  @override
  String get timerIsAlreadyRunning => '计时器已在运行';

  @override
  String get buttonKeepIt => '保留配置';

  @override
  String get buttonApplyChanges => '应用更改';

  @override
  String get keyNoTranslationAvailable => '无可用翻译';

  @override
  String get keyWarmUpText => '热身';

  @override
  String get keyCoreText => '核心';

  @override
  String get keyLearningText => '学习';

  @override
  String get keyWorkingToMyJob => '工作';

  @override
  String get keyMail => '邮件管理';

  @override
  String get keySearchJob => '寻找工作';

  @override
  String get keyCookingSteak => '煎牛排';

  @override
  String get keyCookingNuggets => '炸鸡块';

  @override
  String get textToday => '今天';

  @override
  String get textYesterday => '昨天';

  @override
  String get textDateTime => '日期';

  @override
  String get textPlannedTime => '计划时间';

  @override
  String get textBreakTime => '休息时间';

  @override
  String get textTime => '时间';

  @override
  String get textWorkTime => '运动时间';

  @override
  String get textRestTime => '休息时间';

  @override
  String get textFinishedTime => '已完成';

  @override
  String get textSessionToday => '今日训练';

  @override
  String get textTotalTime => '总时间';

  @override
  String get buttonReturnToTimer => '返回计时器';

  @override
  String get historyDescription => '查看您已完成的健身记录。';

  @override
  String get textSummaryMonthly => '月度总结';

  @override
  String get textTotalSessions => '总训练次数';

  @override
  String get textAverageSession => '平均单次时长';

  @override
  String get textDailySessions => '每日训练';

  @override
  String get textActivityBreakdown => '运动细分';

  @override
  String get textMostProductiveDay => '最高效的一天';

  @override
  String get textLongestStreak => '最长连续天数';

  @override
  String get textLongestStreakDescription => '每日专注目标';

  @override
  String get textTaskCompleted => '任务已完成';

  @override
  String get textBreaksTaken => '休息次数';

  @override
  String get textBreaksTakenDescription => '总休息次数';

  @override
  String textNSession(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 次训练',
      one: '1 次训练',
      zero: '无训练',
    );
    return '$_temp0';
  }

  @override
  String textNDay(num count) {
    final intl.NumberFormat countNumberFormat = intl.NumberFormat.compact(
      locale: localeName,
    );
    final String countString = countNumberFormat.format(count);

    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$countString 天',
      one: '1 天',
      zero: '无天数',
    );
    return '$_temp0';
  }

  @override
  String get textShortMonday => '周一';

  @override
  String get textShortTuesday => '周二';

  @override
  String get textShortWednesday => '周三';

  @override
  String get textShortThursday => '周四';

  @override
  String get textShortFriday => '周五';

  @override
  String get textShortSaturday => '周六';

  @override
  String get textShortSunday => '周日';

  @override
  String get error404Description => '页面未找到';

  @override
  String languageSelected(String language) {
    String _temp0 = intl.Intl.selectLogic(
      language,
      {
        'en': '英文',
        'fr': '法文',
        'other': '英文',
      },
    );
    return '语言 - $_temp0';
  }

  @override
  String get ofText => '/';

  @override
  String get sessionCompletedText => '训练已完成';

  @override
  String get welcomeScreenTitlePrefix => '您比任何人都更懂您的 ';

  @override
  String get welcomeScreenTitleHighlight => '计划';

  @override
  String get welcomeScreenTitleSuffix => '。';

  @override
  String get welcomeScreenSubtitleKnowledge => '本应用假设您已熟记\n您的健身动作。';

  @override
  String get welcomeScreenSubtitleSequence => '按您的喜好自由编排动作顺序。';

  @override
  String get buttonGetStarted => '立即开始';

  @override
  String get maintenanceDatabaseReloadFixtures => '配置：重新加载默认配置';

  @override
  String get maintenanceHistoryDeleteAllData => '历史：清除所有历史记录';

  @override
  String get maintenanceButtonDeleteHistory => '删除历史记录';

  @override
  String get maintenanceToastHistoryDeleted => '历史记录已删除';

  @override
  String get feedbackImprovementTitle => '帮助我们改进！';

  @override
  String get feedbackHintText => '告诉我们更多...';

  @override
  String get feedbackSendButton => '发送';

  @override
  String get onboardingSlide2Title => '定制您的节奏';

  @override
  String get onboardingSlide2Subtitle1 => '设置适合您的运动时间、休息间隔和循环组数。';

  @override
  String get onboardingSlide2Subtitle2 => '启用声音提示，并自由选择圆盘或经典计时器布局。';

  @override
  String get onboardingSlide3Title => '追踪您的进步';

  @override
  String get onboardingSlide3Subtitle1 => '查看已完成的锻炼记录，轻松掌握每月统计数据。';

  @override
  String get onboardingSlide3Subtitle2 => '分析您最高效的锻炼日，并保持每日专注连续记录。';

  @override
  String get buttonSkip => '跳过';

  @override
  String get drawerRelaunchOnboardingText => '快速导览';

  @override
  String get buttonNext => '下一步';
}

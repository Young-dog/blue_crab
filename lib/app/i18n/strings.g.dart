/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 48 (24 per locale)
///
/// Built on 2023-11-12 at 21:14 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.en;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.en) // set locale
/// - Locale locale = AppLocale.en.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.en) // locale check
enum AppLocale with BaseAppLocale<AppLocale, _StringsEn> {
	en(languageCode: 'en', build: _StringsEn.build),
	ru(languageCode: 'ru', build: _StringsRu.build);

	const AppLocale({required this.languageCode, this.scriptCode, this.countryCode, required this.build}); // ignore: unused_element

	@override final String languageCode;
	@override final String? scriptCode;
	@override final String? countryCode;
	@override final TranslationBuilder<AppLocale, _StringsEn> build;

	/// Gets current instance managed by [LocaleSettings].
	_StringsEn get translations => LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
_StringsEn get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class Translations {
	Translations._(); // no constructor

	static _StringsEn of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context).translations;
}

/// The provider for method B
class TranslationProvider extends BaseTranslationProvider<AppLocale, _StringsEn> {
	TranslationProvider({required super.child}) : super(settings: LocaleSettings.instance);

	static InheritedLocaleData<AppLocale, _StringsEn> of(BuildContext context) => InheritedLocaleData.of<AppLocale, _StringsEn>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
	_StringsEn get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings extends BaseFlutterLocaleSettings<AppLocale, _StringsEn> {
	LocaleSettings._() : super(utils: AppLocaleUtils.instance);

	static final instance = LocaleSettings._();

	// static aliases (checkout base methods for documentation)
	static AppLocale get currentLocale => instance.currentLocale;
	static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
	static AppLocale setLocale(AppLocale locale, {bool? listenToDeviceLocale = false}) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale setLocaleRaw(String rawLocale, {bool? listenToDeviceLocale = false}) => instance.setLocaleRaw(rawLocale, listenToDeviceLocale: listenToDeviceLocale);
	static AppLocale useDeviceLocale() => instance.useDeviceLocale();
	@Deprecated('Use [AppLocaleUtils.supportedLocales]') static List<Locale> get supportedLocales => instance.supportedLocales;
	@Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]') static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
	static void setPluralResolver({String? language, AppLocale? locale, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver}) => instance.setPluralResolver(
		language: language,
		locale: locale,
		cardinalResolver: cardinalResolver,
		ordinalResolver: ordinalResolver,
	);
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, _StringsEn> {
	AppLocaleUtils._() : super(baseLocale: _baseLocale, locales: AppLocale.values);

	static final instance = AppLocaleUtils._();

	// static aliases (checkout base methods for documentation)
	static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
	static AppLocale parseLocaleParts({required String languageCode, String? scriptCode, String? countryCode}) => instance.parseLocaleParts(languageCode: languageCode, scriptCode: scriptCode, countryCode: countryCode);
	static AppLocale findDeviceLocale() => instance.findDeviceLocale();
	static List<Locale> get supportedLocales => instance.supportedLocales;
	static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class _StringsEn implements BaseTranslations<AppLocale, _StringsEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final _StringsEn _root = this; // ignore: unused_field

	// Translations
	late final _StringsPriorityTaskEn priority_task = _StringsPriorityTaskEn._(_root);
	late final _StringsCommonEn common = _StringsCommonEn._(_root);
	late final _StringsTrackLocationEn track_location = _StringsTrackLocationEn._(_root);
}

// Path: priority_task
class _StringsPriorityTaskEn {
	_StringsPriorityTaskEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get critical => 'Critical';
	String get important => 'Important';
	String get medium => 'Medium';
	String get low => 'Low';
	String get deferred => 'Deferred';
}

// Path: common
class _StringsCommonEn {
	_StringsCommonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsCommonDateTimeModelEn date_time_model = _StringsCommonDateTimeModelEn._(_root);
	late final _StringsCommonTagButtonEn tag_button = _StringsCommonTagButtonEn._(_root);
	late final _StringsCommonDateTimePinEn date_time_pin = _StringsCommonDateTimePinEn._(_root);
	late final _StringsCommonTimePinEn time_pin = _StringsCommonTimePinEn._(_root);
	late final _StringsCommonSubtaskInputEn subtask_input = _StringsCommonSubtaskInputEn._(_root);
	String get descriptions_input => 'Description';
	late final _StringsCommonRepeatDaysModalEn repeat_days_modal = _StringsCommonRepeatDaysModalEn._(_root);
}

// Path: track_location
class _StringsTrackLocationEn {
	_StringsTrackLocationEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title_label => 'Title...';
	late final _StringsTrackLocationHabitPageEn habit_page = _StringsTrackLocationHabitPageEn._(_root);
	late final _StringsTrackLocationTrackPageEn track_page = _StringsTrackLocationTrackPageEn._(_root);
	late final _StringsTrackLocationTaskTypeEn task_type = _StringsTrackLocationTaskTypeEn._(_root);
}

// Path: common.date_time_model
class _StringsCommonDateTimeModelEn {
	_StringsCommonDateTimeModelEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	late final _StringsCommonDateTimeModelCalendarButtonEn calendar_button = _StringsCommonDateTimeModelCalendarButtonEn._(_root);
}

// Path: common.tag_button
class _StringsCommonTagButtonEn {
	_StringsCommonTagButtonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String tag_title({required Object tag}) => '# ${tag}';
}

// Path: common.date_time_pin
class _StringsCommonDateTimePinEn {
	_StringsCommonDateTimePinEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String date({required Object day, required Object month}) => '${day} ${month} ';
	String time({required Object hours, required Object minutes}) => '${hours}:${minutes}';
}

// Path: common.time_pin
class _StringsCommonTimePinEn {
	_StringsCommonTimePinEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String time_tittle({required Object hours, required Object minutes}) => '${hours}:${minutes}';
}

// Path: common.subtask_input
class _StringsCommonSubtaskInputEn {
	_StringsCommonSubtaskInputEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get hint_text => 'Subtask';
}

// Path: common.repeat_days_modal
class _StringsCommonRepeatDaysModalEn {
	_StringsCommonRepeatDaysModalEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get every_day_title => 'Every day';
}

// Path: track_location.habit_page
class _StringsTrackLocationHabitPageEn {
	_StringsTrackLocationHabitPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get repetitions_habit_title => 'Repetitions';
	String get missed_habit_title => 'Missed';
	String get completed_habit_title => 'Completed';
}

// Path: track_location.track_page
class _StringsTrackLocationTrackPageEn {
	_StringsTrackLocationTrackPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get habits_box_title => 'Habits';
	String get purposes_box_title => 'Purposes';
	String get tasks_box_title => 'Tasks and events';
}

// Path: track_location.task_type
class _StringsTrackLocationTaskTypeEn {
	_StringsTrackLocationTaskTypeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get task => 'Task';
	String get event => 'Event';
}

// Path: common.date_time_model.calendar_button
class _StringsCommonDateTimeModelCalendarButtonEn {
	_StringsCommonDateTimeModelCalendarButtonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get add => 'Add';
	String get time => '+ Time';
	String get delete => 'Delete';
}

// Path: <root>
class _StringsRu implements _StringsEn {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	_StringsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, _StringsEn> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	@override late final _StringsRu _root = this; // ignore: unused_field

	// Translations
	@override late final _StringsPriorityTaskRu priority_task = _StringsPriorityTaskRu._(_root);
	@override late final _StringsCommonRu common = _StringsCommonRu._(_root);
	@override late final _StringsTrackLocationRu track_location = _StringsTrackLocationRu._(_root);
}

// Path: priority_task
class _StringsPriorityTaskRu implements _StringsPriorityTaskEn {
	_StringsPriorityTaskRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get critical => 'Критичный';
	@override String get important => 'Важный';
	@override String get medium => 'Средний';
	@override String get low => 'Низкий';
	@override String get deferred => 'Отложеный';
}

// Path: common
class _StringsCommonRu implements _StringsCommonEn {
	_StringsCommonRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override late final _StringsCommonDateTimeModelRu date_time_model = _StringsCommonDateTimeModelRu._(_root);
	@override late final _StringsCommonTagButtonRu tag_button = _StringsCommonTagButtonRu._(_root);
	@override late final _StringsCommonDateTimePinRu date_time_pin = _StringsCommonDateTimePinRu._(_root);
	@override late final _StringsCommonTimePinRu time_pin = _StringsCommonTimePinRu._(_root);
	@override late final _StringsCommonSubtaskInputRu subtask_input = _StringsCommonSubtaskInputRu._(_root);
	@override String get descriptions_input => 'Описание';
	@override late final _StringsCommonRepeatDaysModalRu repeat_days_modal = _StringsCommonRepeatDaysModalRu._(_root);
}

// Path: track_location
class _StringsTrackLocationRu implements _StringsTrackLocationEn {
	_StringsTrackLocationRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title_label => 'Название...';
	@override late final _StringsTrackLocationHabitPageRu habit_page = _StringsTrackLocationHabitPageRu._(_root);
	@override late final _StringsTrackLocationTrackPageRu track_page = _StringsTrackLocationTrackPageRu._(_root);
	@override late final _StringsTrackLocationTaskTypeRu task_type = _StringsTrackLocationTaskTypeRu._(_root);
}

// Path: common.date_time_model
class _StringsCommonDateTimeModelRu implements _StringsCommonDateTimeModelEn {
	_StringsCommonDateTimeModelRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override late final _StringsCommonDateTimeModelCalendarButtonRu calendar_button = _StringsCommonDateTimeModelCalendarButtonRu._(_root);
}

// Path: common.tag_button
class _StringsCommonTagButtonRu implements _StringsCommonTagButtonEn {
	_StringsCommonTagButtonRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String tag_title({required Object tag}) => '# ${tag}';
}

// Path: common.date_time_pin
class _StringsCommonDateTimePinRu implements _StringsCommonDateTimePinEn {
	_StringsCommonDateTimePinRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String date({required Object day, required Object month}) => '${day} ${month} ';
	@override String time({required Object hours, required Object minutes}) => '${hours}:${minutes}';
}

// Path: common.time_pin
class _StringsCommonTimePinRu implements _StringsCommonTimePinEn {
	_StringsCommonTimePinRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String time_tittle({required Object hours, required Object minutes}) => '${hours}:${minutes}';
}

// Path: common.subtask_input
class _StringsCommonSubtaskInputRu implements _StringsCommonSubtaskInputEn {
	_StringsCommonSubtaskInputRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get hint_text => 'Подзадача';
}

// Path: common.repeat_days_modal
class _StringsCommonRepeatDaysModalRu implements _StringsCommonRepeatDaysModalEn {
	_StringsCommonRepeatDaysModalRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get every_day_title => 'Каждый день';
}

// Path: track_location.habit_page
class _StringsTrackLocationHabitPageRu implements _StringsTrackLocationHabitPageEn {
	_StringsTrackLocationHabitPageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get repetitions_habit_title => 'Повторений';
	@override String get missed_habit_title => 'Пропущено';
	@override String get completed_habit_title => 'Завершено';
}

// Path: track_location.track_page
class _StringsTrackLocationTrackPageRu implements _StringsTrackLocationTrackPageEn {
	_StringsTrackLocationTrackPageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get habits_box_title => 'Привычки';
	@override String get purposes_box_title => 'Цели';
	@override String get tasks_box_title => 'Задачи и события';
}

// Path: track_location.task_type
class _StringsTrackLocationTaskTypeRu implements _StringsTrackLocationTaskTypeEn {
	_StringsTrackLocationTaskTypeRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get task => 'Задача';
	@override String get event => 'Событие';
}

// Path: common.date_time_model.calendar_button
class _StringsCommonDateTimeModelCalendarButtonRu implements _StringsCommonDateTimeModelCalendarButtonEn {
	_StringsCommonDateTimeModelCalendarButtonRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get add => 'Добавить';
	@override String get time => '+ Время';
	@override String get delete => 'Удалить';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'priority_task.critical': return 'Critical';
			case 'priority_task.important': return 'Important';
			case 'priority_task.medium': return 'Medium';
			case 'priority_task.low': return 'Low';
			case 'priority_task.deferred': return 'Deferred';
			case 'common.date_time_model.calendar_button.add': return 'Add';
			case 'common.date_time_model.calendar_button.time': return '+ Time';
			case 'common.date_time_model.calendar_button.delete': return 'Delete';
			case 'common.tag_button.tag_title': return ({required Object tag}) => '# ${tag}';
			case 'common.date_time_pin.date': return ({required Object day, required Object month}) => '${day} ${month} ';
			case 'common.date_time_pin.time': return ({required Object hours, required Object minutes}) => '${hours}:${minutes}';
			case 'common.time_pin.time_tittle': return ({required Object hours, required Object minutes}) => '${hours}:${minutes}';
			case 'common.subtask_input.hint_text': return 'Subtask';
			case 'common.descriptions_input': return 'Description';
			case 'common.repeat_days_modal.every_day_title': return 'Every day';
			case 'track_location.title_label': return 'Title...';
			case 'track_location.habit_page.repetitions_habit_title': return 'Repetitions';
			case 'track_location.habit_page.missed_habit_title': return 'Missed';
			case 'track_location.habit_page.completed_habit_title': return 'Completed';
			case 'track_location.track_page.habits_box_title': return 'Habits';
			case 'track_location.track_page.purposes_box_title': return 'Purposes';
			case 'track_location.track_page.tasks_box_title': return 'Tasks and events';
			case 'track_location.task_type.task': return 'Task';
			case 'track_location.task_type.event': return 'Event';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'priority_task.critical': return 'Критичный';
			case 'priority_task.important': return 'Важный';
			case 'priority_task.medium': return 'Средний';
			case 'priority_task.low': return 'Низкий';
			case 'priority_task.deferred': return 'Отложеный';
			case 'common.date_time_model.calendar_button.add': return 'Добавить';
			case 'common.date_time_model.calendar_button.time': return '+ Время';
			case 'common.date_time_model.calendar_button.delete': return 'Удалить';
			case 'common.tag_button.tag_title': return ({required Object tag}) => '# ${tag}';
			case 'common.date_time_pin.date': return ({required Object day, required Object month}) => '${day} ${month} ';
			case 'common.date_time_pin.time': return ({required Object hours, required Object minutes}) => '${hours}:${minutes}';
			case 'common.time_pin.time_tittle': return ({required Object hours, required Object minutes}) => '${hours}:${minutes}';
			case 'common.subtask_input.hint_text': return 'Подзадача';
			case 'common.descriptions_input': return 'Описание';
			case 'common.repeat_days_modal.every_day_title': return 'Каждый день';
			case 'track_location.title_label': return 'Название...';
			case 'track_location.habit_page.repetitions_habit_title': return 'Повторений';
			case 'track_location.habit_page.missed_habit_title': return 'Пропущено';
			case 'track_location.habit_page.completed_habit_title': return 'Завершено';
			case 'track_location.track_page.habits_box_title': return 'Привычки';
			case 'track_location.track_page.purposes_box_title': return 'Цели';
			case 'track_location.track_page.tasks_box_title': return 'Задачи и события';
			case 'track_location.task_type.task': return 'Задача';
			case 'track_location.task_type.event': return 'Событие';
			default: return null;
		}
	}
}

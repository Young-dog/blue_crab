/// Generated file. Do not edit.
///
/// Original: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 38 (19 per locale)
///
/// Built on 2023-11-02 at 09:32 UTC

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
	late final _StringsTrackPageEn track_page = _StringsTrackPageEn._(_root);
	late final _StringsPriorityTaskEn priority_task = _StringsPriorityTaskEn._(_root);
	late final _StringsTaskTypeEn task_type = _StringsTaskTypeEn._(_root);
	late final _StringsTaskPageEn task_page = _StringsTaskPageEn._(_root);
	late final _StringsCalendarButtonEn calendar_button = _StringsCalendarButtonEn._(_root);
	late final _StringsSubtaskInputEn subtask_input = _StringsSubtaskInputEn._(_root);
	late final _StringsTaskButtonEn task_button = _StringsTaskButtonEn._(_root);
}

// Path: track_page
class _StringsTrackPageEn {
	_StringsTrackPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get habits_box_title => 'Habits';
	String get purposes_box_title => 'Purposes';
	String get tasks_box_title => 'Tasks and events';
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

// Path: task_type
class _StringsTaskTypeEn {
	_StringsTaskTypeEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get task => 'Task';
	String get event => 'Event';
}

// Path: task_page
class _StringsTaskPageEn {
	_StringsTaskPageEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get title_label => 'Title...';
	late final _StringsTaskPageDateTimePinEn date_time_pin = _StringsTaskPageDateTimePinEn._(_root);
}

// Path: calendar_button
class _StringsCalendarButtonEn {
	_StringsCalendarButtonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get add => 'Добавить';
	String get time => '+ Время';
	String get delete => 'Удалить';
}

// Path: subtask_input
class _StringsSubtaskInputEn {
	_StringsSubtaskInputEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String get hint_text => 'Подзадача';
}

// Path: task_button
class _StringsTaskButtonEn {
	_StringsTaskButtonEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String tag_title({required Object tag}) => '# ${tag}';
	String time_tittle({required Object hours, required Object minutes}) => '${hours}:${minutes}';
}

// Path: task_page.date_time_pin
class _StringsTaskPageDateTimePinEn {
	_StringsTaskPageDateTimePinEn._(this._root);

	final _StringsEn _root; // ignore: unused_field

	// Translations
	String date({required Object day, required Object month}) => '${day} ${month} ';
	String time({required Object hours, required Object minutes}) => '${hours}:${minutes}';
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
	@override late final _StringsTrackPageRu track_page = _StringsTrackPageRu._(_root);
	@override late final _StringsPriorityTaskRu priority_task = _StringsPriorityTaskRu._(_root);
	@override late final _StringsTaskTypeRu task_type = _StringsTaskTypeRu._(_root);
	@override late final _StringsTaskPageRu task_page = _StringsTaskPageRu._(_root);
	@override late final _StringsCalendarButtonRu calendar_button = _StringsCalendarButtonRu._(_root);
	@override late final _StringsSubtaskInputRu subtask_input = _StringsSubtaskInputRu._(_root);
	@override late final _StringsTaskButtonRu task_button = _StringsTaskButtonRu._(_root);
}

// Path: track_page
class _StringsTrackPageRu implements _StringsTrackPageEn {
	_StringsTrackPageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get habits_box_title => 'Привычки';
	@override String get purposes_box_title => 'Цели';
	@override String get tasks_box_title => 'Задачи и события';
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

// Path: task_type
class _StringsTaskTypeRu implements _StringsTaskTypeEn {
	_StringsTaskTypeRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get task => 'Задача';
	@override String get event => 'Событие';
}

// Path: task_page
class _StringsTaskPageRu implements _StringsTaskPageEn {
	_StringsTaskPageRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get title_label => 'Название...';
	@override late final _StringsTaskPageDateTimePinRu date_time_pin = _StringsTaskPageDateTimePinRu._(_root);
}

// Path: calendar_button
class _StringsCalendarButtonRu implements _StringsCalendarButtonEn {
	_StringsCalendarButtonRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get add => 'Добавить';
	@override String get time => '+ Время';
	@override String get delete => 'Удалить';
}

// Path: subtask_input
class _StringsSubtaskInputRu implements _StringsSubtaskInputEn {
	_StringsSubtaskInputRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String get hint_text => 'Подзадача';
}

// Path: task_button
class _StringsTaskButtonRu implements _StringsTaskButtonEn {
	_StringsTaskButtonRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String tag_title({required Object tag}) => '# ${tag}';
	@override String time_tittle({required Object hours, required Object minutes}) => '${hours}:${minutes}';
}

// Path: task_page.date_time_pin
class _StringsTaskPageDateTimePinRu implements _StringsTaskPageDateTimePinEn {
	_StringsTaskPageDateTimePinRu._(this._root);

	@override final _StringsRu _root; // ignore: unused_field

	// Translations
	@override String date({required Object day, required Object month}) => '${day} ${month} ';
	@override String time({required Object hours, required Object minutes}) => '${hours}:${minutes}';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on _StringsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'track_page.habits_box_title': return 'Habits';
			case 'track_page.purposes_box_title': return 'Purposes';
			case 'track_page.tasks_box_title': return 'Tasks and events';
			case 'priority_task.critical': return 'Critical';
			case 'priority_task.important': return 'Important';
			case 'priority_task.medium': return 'Medium';
			case 'priority_task.low': return 'Low';
			case 'priority_task.deferred': return 'Deferred';
			case 'task_type.task': return 'Task';
			case 'task_type.event': return 'Event';
			case 'task_page.title_label': return 'Title...';
			case 'task_page.date_time_pin.date': return ({required Object day, required Object month}) => '${day} ${month} ';
			case 'task_page.date_time_pin.time': return ({required Object hours, required Object minutes}) => '${hours}:${minutes}';
			case 'calendar_button.add': return 'Добавить';
			case 'calendar_button.time': return '+ Время';
			case 'calendar_button.delete': return 'Удалить';
			case 'subtask_input.hint_text': return 'Подзадача';
			case 'task_button.tag_title': return ({required Object tag}) => '# ${tag}';
			case 'task_button.time_tittle': return ({required Object hours, required Object minutes}) => '${hours}:${minutes}';
			default: return null;
		}
	}
}

extension on _StringsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'track_page.habits_box_title': return 'Привычки';
			case 'track_page.purposes_box_title': return 'Цели';
			case 'track_page.tasks_box_title': return 'Задачи и события';
			case 'priority_task.critical': return 'Критичный';
			case 'priority_task.important': return 'Важный';
			case 'priority_task.medium': return 'Средний';
			case 'priority_task.low': return 'Низкий';
			case 'priority_task.deferred': return 'Отложеный';
			case 'task_type.task': return 'Задача';
			case 'task_type.event': return 'Событие';
			case 'task_page.title_label': return 'Название...';
			case 'task_page.date_time_pin.date': return ({required Object day, required Object month}) => '${day} ${month} ';
			case 'task_page.date_time_pin.time': return ({required Object hours, required Object minutes}) => '${hours}:${minutes}';
			case 'calendar_button.add': return 'Добавить';
			case 'calendar_button.time': return '+ Время';
			case 'calendar_button.delete': return 'Удалить';
			case 'subtask_input.hint_text': return 'Подзадача';
			case 'task_button.tag_title': return ({required Object tag}) => '# ${tag}';
			case 'task_button.time_tittle': return ({required Object hours, required Object minutes}) => '${hours}:${minutes}';
			default: return null;
		}
	}
}

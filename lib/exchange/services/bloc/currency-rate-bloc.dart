import 'dart:async';

import 'package:finansalproje/exchange/services/networking/response.dart';
import 'package:finansalproje/exchange/services/repository/currency-rates-repository.dart';
import 'package:finansalproje/exchange/model/currency-rates.dart';
import 'package:rxdart/subjects.dart';

class CurrencyRatesListBloc {
  CurrencyRatesRepository _currencyRatesListRepository;
  StreamController _currencyRatesListController;

  StreamSink<Response<CurrencyRates>> get currecyRatesListSink =>
      _currencyRatesListController.sink;

  Stream<Response<CurrencyRates>> get currencyRatesListStream =>
      _currencyRatesListController.stream;

  CurrencyRatesListBloc() {
    _currencyRatesListController = BehaviorSubject<Response<CurrencyRates>>();
    _currencyRatesListRepository = CurrencyRatesRepository();
  }

  fetchBaseCurrencyRates(String baseCurrency) async {
    currecyRatesListSink.add(Response.loading('Getting Currency Rates List.'));
    try {
      CurrencyRates currencyRates =
          await _currencyRatesListRepository.fetchBaseCurrencyRates(baseCurrency);

      currecyRatesListSink.add(Response.completed(currencyRates));
    } catch (e) {
      currecyRatesListSink.add(Response.error(e.toString()));
      print(e);
    }
  }

  dispose() {
    _currencyRatesListController?.close();
  }
}
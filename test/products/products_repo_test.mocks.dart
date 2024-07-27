// Mocks generated by Mockito 5.4.4 from annotations
// in nana_mobile_task/test/products/products_repo_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:nana_mobile_task/core/utils/remote_request_manager/remote_request_manager.dart'
    as _i2;
import 'package:nana_mobile_task/features/products/data/model/products/products_request_model.dart'
    as _i3;

import 'products_repo_test.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeRemoteRequestManager_0 extends _i1.SmartFake
    implements _i2.RemoteRequestManager {
  _FakeRemoteRequestManager_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductsRequestModel_1 extends _i1.SmartFake
    implements _i3.ProductsRequestModel {
  _FakeProductsRequestModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [MockProductsRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockMockProductsRemoteDataSource extends _i1.Mock
    implements _i4.MockProductsRemoteDataSource {
  MockMockProductsRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.RemoteRequestManager get remoteRequestManager => (super.noSuchMethod(
        Invocation.getter(#remoteRequestManager),
        returnValue: _FakeRemoteRequestManager_0(
          this,
          Invocation.getter(#remoteRequestManager),
        ),
      ) as _i2.RemoteRequestManager);

  @override
  _i5.Future<_i3.ProductsRequestModel> getProducts({String? page}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProducts,
          [],
          {#page: page},
        ),
        returnValue: _i5.Future<_i3.ProductsRequestModel>.value(
            _FakeProductsRequestModel_1(
          this,
          Invocation.method(
            #getProducts,
            [],
            {#page: page},
          ),
        )),
      ) as _i5.Future<_i3.ProductsRequestModel>);
}

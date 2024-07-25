import "package:flutter/material.dart";

SliverGridDelegateWithMaxCrossAxisExtent verticalGridDelegate() =>
    const SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 100,
      childAspectRatio: 0.4,
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
    );

SliverGridDelegateWithFixedCrossAxisCount horizontalGridDelegate() =>
    const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 1,
      mainAxisSpacing: 5,
      crossAxisSpacing: 10,
      childAspectRatio: (0.8 / .4),
    );

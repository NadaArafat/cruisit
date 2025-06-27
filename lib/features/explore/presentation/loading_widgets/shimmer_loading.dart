import 'package:cruisit/features/explore/presentation/loading_widgets/shimmer.dart';
import 'package:flutter/material.dart';

class ShimmerLoading extends StatefulWidget {
  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
  });

  final bool isLoading;
  final Widget child;

  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading> {
  Listenable? _shimmerChanges;
  Offset? _offsetWithinShimmer;

  @override
  void initState() {
    super.initState();

    // Post-frame to wait until layout is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox = context.findRenderObject();
      final shimmer = Shimmer.of(context);
      if (mounted && renderBox is RenderBox && shimmer != null) {
        setState(() {
          _offsetWithinShimmer = shimmer.getDescendantOffset(
            descendant: renderBox,
          );
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _shimmerChanges?.removeListener(_onShimmerChange);
    _shimmerChanges = Shimmer.of(context)?.shimmerChanges;
    _shimmerChanges?.addListener(_onShimmerChange);
  }

  @override
  void dispose() {
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading && mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isLoading) {
      return widget.child;
    }

    final shimmer = Shimmer.of(context);
    if (shimmer == null || !shimmer.isSized || _offsetWithinShimmer == null) {
      return const SizedBox(); // Avoid crash
    }

    final shimmerSize = shimmer.size;
    final gradient = shimmer.gradient;

    return ShaderMask(
      blendMode: BlendMode.srcATop,
      shaderCallback: (bounds) {
        return gradient.createShader(
          Rect.fromLTWH(
            -_offsetWithinShimmer!.dx,
            -_offsetWithinShimmer!.dy,
            shimmerSize.width,
            shimmerSize.height,
          ),
        );
      },
      child: widget.child,
    );
  }
}

import 'package:flow_builder/flow_builder.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage._();
  static Route<void> route() {
    return MaterialPageRoute(builder: (_) => const OnboardingPage._());
  }

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  late FlowController<int> _controller;

  @override
  void initState() {
    super.initState();
    _controller = FlowController(0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => _controller.complete(),
        ),
      ),
      body: FlowBuilder<int>(
        controller: _controller,
        onGeneratePages: (int state, List<Page<dynamic>> pages) {
          return [
            for (var i = 0; i <= state; i++) OnboardingStep.page(i),
          ];
        },
      ),
    );
  }
}

class OnboardingStep extends StatelessWidget {
  const OnboardingStep({required this.step, super.key});

  static Page<void> page(int step) {
    return MaterialPage<void>(child: OnboardingStep(step: step));
  }

  final int step;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Step $step', style: theme.textTheme.displayLarge),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: context.flow<int>().state <= 0
                    ? null
                    : () => context.flow<int>().update((s) => s - 1),
                child: const Text('Previous'),
              ),
              TextButton(
                child: const Text('Next'),
                onPressed: () {
                  context.flow<int>().update((s) => s + 1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

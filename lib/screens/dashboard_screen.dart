import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/game_score_model.dart';
import '../widgets/action_button.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final GameScoreModel _gameScoreModel = GameScoreModel();

  void _incrementScore(int team, int points) {
    setState(() {
      _gameScoreModel.incrementScore(team, points);
    });
  }

  void _revertScore() {
    setState(() {
      _gameScoreModel.revertLastScore();
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.title),
        backgroundColor: Colors.greenAccent,
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(loc.teamA, style: Theme.of(context).textTheme.headlineSmall),
                        Text('${_gameScoreModel.teamOneScore}', style: Theme.of(context).textTheme.headlineMedium),
                        ActionButton(label: loc.freeThrow, onPressed: () => _incrementScore(1, 1)),
                        ActionButton(label: loc.twoPoints, onPressed: () => _incrementScore(1, 2)),
                        ActionButton(label: loc.threePoints, onPressed: () => _incrementScore(1, 3)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      children: [
                        Text(loc.teamB, style: Theme.of(context).textTheme.headlineSmall),
                        Text('${_gameScoreModel.teamTwoScore}', style: Theme.of(context).textTheme.headlineMedium),
                        ActionButton(label: loc.freeThrow, onPressed: () => _incrementScore(2, 1)),
                        ActionButton(label: loc.twoPoints, onPressed: () => _incrementScore(2, 2)),
                        ActionButton(label: loc.threePoints, onPressed: () => _incrementScore(2, 3)),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: _gameScoreModel.lastMove == 0 ? null : _revertScore,
                child: Text(loc.undo),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

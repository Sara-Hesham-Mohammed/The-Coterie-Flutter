import 'package:flutter/material.dart';

// Favourites chip (heart icon, change it to a diff icon and maybe)
class InterestChip extends StatefulWidget {
  final String label;
  const InterestChip({super.key, required this.label});

  @override
  State<InterestChip> createState() => _InterestChipState();
}

class _InterestChipState extends State<InterestChip> {
  bool favorite = false;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
          avatar: Icon(favorite ? Icons.check : Icons.check,
            color: favorite ? Colors.white : Colors.grey,
          ),
          label: Text(widget.label,
            style: Theme.of(context).textTheme.labelLarge,),
          color: WidgetStateProperty.all(Theme.of(context).colorScheme.primaryContainer),
          onPressed: () {
            setState(() {
              favorite = !favorite;
            });
          },
    );
  }
}

/************************************************/

//Flitering chips
enum Filter { walking, running, cycling, hiking } // put the categories here

class FilteringChip extends StatefulWidget {
  const FilteringChip({super.key});

  @override
  State<FilteringChip> createState() => _FilteringChipState();
}

class _FilteringChipState extends State<FilteringChip> {
  Set<Filter> filters = <Filter>{};

  @override
  Widget build(BuildContext context) {

    return
      Wrap(
        spacing: 5.0,
        children: Filter.values.map((Filter exercise) {
          return FilterChip(
            label: Text(exercise.name),
            selected: filters.contains(exercise),
            onSelected: (bool selected) {
              setState(() {
                if (selected) {
                  filters.add(exercise);
                } else {
                  filters.remove(exercise);
                }
              });
            },
          );
        }).toList(),
      );
  }
}

import 'package:flutter/material.dart';

class CategoryCard extends StatefulWidget {
  final Icon? icon;
  final String label;
  final bool isSelected;

  const CategoryCard(
      {Key? key,
      required this.icon,
      required this.label,
      required this.isSelected})
      : super(key: key);

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  @override
  Widget build(BuildContext context) {

    Size _size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: Icon(
              widget.isSelected ? Icons.check_circle_rounded : Icons.check_circle_outline_rounded,
              color: widget.isSelected ? Colors.green : Colors.black87,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey.shade400, spreadRadius: 1)],
              ),
              child: CircleAvatar(
                radius: _size.width * 0.1,
                backgroundColor: Colors.grey.shade200,
                child: widget.icon,
              ),
            ),
          ),
          Positioned(
            width: 150,
            bottom: 10,
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Text(
                widget.label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
    );
  }
}

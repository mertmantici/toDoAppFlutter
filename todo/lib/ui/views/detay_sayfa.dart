import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/ui/cubit/detay_sayfa_cubit.dart';

import '../../data/entity/notlar.dart';

class DetaySayfa extends StatefulWidget {
  Notlar not;

  DetaySayfa({required this.not});

  @override
  State<DetaySayfa> createState() => _DetaySayfaState();
}

class _DetaySayfaState extends State<DetaySayfa> {
  var tfNot = TextEditingController();
  @override
  void initState() {
    super.initState();
    tfNot.text = widget.not.name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'ToDo Oluştur',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.green,
                width: double.infinity,
                height: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                    maxLines: null,
                    controller: tfNot,
                    cursorColor: Colors.white,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Not oluştur",
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () {
                    context
                        .read<DetaySayfaCubit>()
                        .guncelle(widget.not.id, tfNot.text);
                  },
                  child: const Text(
                    "Güncelle",
                    style: TextStyle(color: Colors.white, fontSize: 21),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/entity/notlar.dart';
import 'package:todo/ui/cubit/anasayfa_cubit.dart';
import 'package:todo/ui/views/detay_sayfa.dart';
import 'package:todo/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().notlariYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: aramaYapiliyorMu
            ? Align(
                alignment: Alignment.center,
                child: TextField(
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (aranan) {
                    context.read<AnasayfaCubit>().notlariYukleArama(aranan);
                  },
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Not arayın",
                      hintStyle: TextStyle(color: Colors.white)),
                ),
              )
            : const Align(
                alignment: Alignment.center,
                child: Text(
                  "ToDo",
                  style: TextStyle(color: Colors.white),
                ),
              ),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = false;
                    });
                    context.read<AnasayfaCubit>().notlariYukle();
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyorMu = true;
                    });
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: BlocBuilder<AnasayfaCubit, List<Notlar>>(
                builder: (context, notListesi) {
              if (notListesi.isNotEmpty) {
                return Center(
                  child: ListView.builder(
                    itemCount: notListesi.length,
                    itemBuilder: (context, index) {
                      var not = notListesi[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetaySayfa(not: not))).then((i) {
                              context.read<AnasayfaCubit>().notlariYukle();
                            });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.lightGreen, width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Colors.green,
                            elevation: 10,
                            child: Row(
                              children: [
                                Expanded(
                                    flex: 7,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        not.name,
                                        style: const TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    )),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      context.read<AnasayfaCubit>().sil(not.id);
                                    },
                                    icon: const Icon(Icons.delete_forever),
                                    color: Colors.orangeAccent,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return const Center();
            }),
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.green,
                child: const Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text(
                          '"Disiplin, özgürlüğün köprüsüdür." – Jim Rohn',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: 40,
                      ),
                    )
                  ],
                ),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 10,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: Colors.lightGreen, width: 2)),
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const KayitSayfa()))
              .then((i) {
            context.read<AnasayfaCubit>().notlariYukle();
          });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

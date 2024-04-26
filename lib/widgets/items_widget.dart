import 'package:flutter/material.dart';
import 'package:project/topup_Screen/AOV_Screen.dart';
import 'package:project/topup_Screen/COC_screen.dart';
import 'package:project/topup_Screen/Cod_Screen.dart';
import 'package:project/topup_Screen/Cr_Screen.dart';
import 'package:project/topup_Screen/Ghensin_Screen.dart';
import 'package:project/topup_Screen/Hongkai_Screen.dart';
import 'package:project/topup_Screen/ML_Screen.dart';
import 'package:project/topup_Screen/NewState_Screen.dart';
import 'package:project/topup_Screen/Pubg_Screen.dart';
import 'package:project/topup_Screen/Valo_Screen.dart';
import 'package:project/topup_Screen/ff_Screen.dart';
import 'package:project/topup_Screen/fortnite_Screen.dart';

class ItemsWidget extends StatelessWidget {
  List<String> img = [
    'wanwan',
    'topup pubg',
    'topupepep',
    'topup cod',
    'topup cr',
    'topup coc',
    'topup gensin',
    'topup valo',
    'topup fortnite',
    'topup Aov',
    'topup hongkai',
    'newstate',
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (78 / 100),
      children: [
        for (int i = 0; i < img.length; i++)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              // color: Color(0xff38A3A5),
            ),
            child: InkWell(
              onTap: () {
                navigateToPage(context, img[i]);
              },
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double imageSize = constraints.maxWidth;
                  return Container(
                    width: imageSize,
                    height: imageSize,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("images/${img[i]}.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
      ],
    );
  }

  void navigateToPage(BuildContext context, String imgName) {
    if (imgName == 'topup Aov') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AovTopup()));
    } else if (imgName == 'topup coc') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CocTopUp()));
    } else if (imgName == 'wanwan'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => MlScreen()));
    }else if (imgName == 'topup pubg'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => PubgScreen()));
    }
    else if (imgName == 'topupepep'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => FFScreen()));
    }
    else if (imgName == 'topup cr'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => CrScreen()));
    }
    else if (imgName == 'topup gensin'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => GenshinScreen()));
    }
    else if (imgName == 'topup valo'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ValoScreen()));
    }
    else if (imgName == 'topup fortnite'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => forntniteScreen()));
    }
    else if (imgName == 'topup hongkai'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => HongkaiScreen()));
    }
    else if (imgName == 'newstate'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => NewstateScreen()));
    }
    else if (imgName == 'topup cod'){
      Navigator.push(context, MaterialPageRoute(builder: (context) => CodScreen()));
    } else {

    }
  }
}
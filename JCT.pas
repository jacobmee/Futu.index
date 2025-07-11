{
    AUTHOR: JACOB.MI
    VERSION: 0.1 - 2025.6.14
    用20日线和5日线来标出趋势。
    蓝色 COLOR66CCFF 表示上升趋势；橙色 COLORFFAA66 表示下降趋势；紫色 COLOREAADEA 表示反转可能
}

{ 5日/20日线 }
MA20: EMA(CLOSE, 20), COLOR66CCFF, LINETHICK2;
MA5: EMA(CLOSE, 5), COLOREAADEA, LINETHICK1;

{ BOOL线 }
DIS := STDP(CLOSE, 20);
MID := MA(CLOSE, 20);
UPPER: MID + 2 * DIS, COLOREAEAEA, LINETHICK2;
LOWER: MID - 2 * DIS, COLOREAEAEA, LINETHICK2;

{ 下降趋势画橙色 }
DOWN: IF(MA5 < MA20, MA20, DRAWNULL), COLORFFAA66, LINETHICK2;

{ 画阴影 }
STICKLINE(MA5 < MA20 AND MA5 > CLOSE, MA5, MA20, 0.1, 0), COLORFFAA66;
STICKLINE(MA5 > MA20 AND MA5 < CLOSE, MA5, MA20, 0.1, 0), COLOR66CCFF;

{ 画短期线的反对点 ⊙＊※¤ }
MARKER := (MA5 > MA20 AND MA5 > CLOSE) OR (MA5 < MA20 AND MA5 < CLOSE);
DRAWTEXT(MARKER, MA5, '※'), COLOR871F78;
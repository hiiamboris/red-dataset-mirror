Red [
    Author: "Guaracy Monteiro"
    File: %extenso.red
    Date: {27/11/2015}
    Note: {
        - Converte um valor numérico para o correspondente extenso.
        - Padrão em reais mas pode retornar distância ou peso
    }
    Usage: {
        extenso/from 1234.5
        extenso/from/kg 1234.5
        extenso/from/km 234.5
    }
]


extenso: object [
    ; definições dos numerais
    numerais: #(
        1 um
        2 dois
        3 três
        4 quatro
        5 cinco
        6 seis
        7 sete
        8 oito
        9 nove
        10 dez
        11 onze
        12 doze
        13 treze
        14 quatorze
        15 quinze
        16 dezeseis
        17 dezesete
        18 dezoito
        19 dezenove
        20 vinte
        30 trinta
        40 quarenta
        50 cinquenta
        60 sessenta
        70 setenta
        80 oitenta
        90 noventa
        100 cento
        200 duzentos
        300 trezentos
        400 quatrocentos
        500 quinhentos
        600 seissentos
        700 setecentos
        800 oitocentos
        900 novecentos
    )

    ; unidades financeiras : R$
    financeira: [
        [centavo centavos]
        [real reais]
    ]

    ; unidades de peso : quilos
    peso: [
        [grama gramas]
        [quilo quilos]
        [tonelada toneladas]
    ]

    ; unidades de distância : metros
    distancia: [
        [centímetro centímetros]
        [metro metros]
        [quilometro quilometros]
    ]

    ; definição das centenas
    centenas: [
        [mil mil]
        [milhão milhões]
        [bilhão bilhões]
        [trilhão trilhões]
    ]

    ; converte uma centena para extenso
    to-extenso-centena: function[ext valor idxu [integer!] unidades][
        ;ext: copy ""
        if zero? valor [
            return ext
        ]
        ; converte centena, dezena e unidade para extenso
        ct: valor / 100 ; centenas
        dz: valor // 100 ; dezenas
        un: valor // 10 ; unidades
        case/all [
            valor = 100 [
                ext: "cem"
            ]
            valor > 100 [
                append ext numerais/(ct * 100)
                if dz > 0 [append ext " e "]
            ]
            dz > 19 [
                append ext numerais/(dz / 10 * 10)
                if un > 0 [
                    append ext " e "
                    append ext numerais/:un
                ]
            ]
            (dz > 0) and (dz < 20) [
                append ext numerais/:dz
            ]
        ]
        ; adiciona unidade da centena ao extenso
        append ext " "
        either valor = 1 [
            append ext unidades/:idxu/1
            ][
            append ext unidades/:idxu/2
        ]
        return ext
        ]

    from: function [ valor [integer! float!] /km /kg][
    
    vint: copy "" ; parte inteira do valor
    vdec: copy "" ; parte fracionária do valor
    parse to string! to float! valor [copy vint to "." skip copy vdec to end]
    ; número de dígitos inteiros deve ser multiplo de três; se não for, adicoina zeros
    lint: (length? vint)
    if lint % 3 > 0 [insert/dup vint "0" 3 - (lint % 3)]
    ; número de casas decimais deve ser duas
    vdec: copy/part append vdec "00" 2
    ; ajusta unidades
    unidades: copy centenas
    case [
        km [insert unidades distancia]
        kg [insert unidades peso
            append vdec "0" ; ajuste de gramas 0,5kg = 500g
        ]
        true [insert unidades financeira] ;se não é kg ou km é default R$
    ]
    ; separa a parte inteira em centenas e os coloca em um bloco
    vmat: copy []
    digits: charset "0123456789"
    trio: [3 digits]
    parse vint [any [begin: trio (append vmat to integer! copy/part begin 3)]]
    append vmat to integer! vdec
    i: length? vmat ; ordem do trio/centena
    ix: 1
    ext: copy ""
    ; chama o extenso para cada centena do bloco para a designação
    foreach v vmat [
        ;append ext to-extenso-centena ext v i unidades
        to-extenso-centena ext v i unidades
;        if v = 0[
;            if i = 2 [
;                if (not km) and (not kg) [
;                    if ((to integer! valor) > 1) [append ext " reais "]
;                ]
;            ]
;        ]
        if all [(v = 0) (i = 2) (not km) (not kg) ((to integer! valor) > 1)]
            [append ext " reais "]
        ix: ix + 1
        case [
            i > 2 [if (vmat/:ix > 0) [append ext ", "]]
            i > 1 [if (last vmat) > 0 [append ext " e "]]
        ]
        i: i - 1
    ]
    return trim ext
    ]
    
]

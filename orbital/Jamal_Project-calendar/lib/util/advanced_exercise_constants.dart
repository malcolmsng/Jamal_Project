// import 'package:flutter/cupertino.dart';
import 'package:jamal_v1/model/exercise.dart' as ex;
import 'package:jamal_v1/model/fitness.dart';
import 'package:jamal_v1/model/equipment.dart';

ex.Exercise pikePushup = ex.Exercise(
  name: 'Pike Pushup',
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  focus: [ex.Focus.Shoulder, ex.Focus.Chest, ex.Focus.Tricep],
  vidURL: 'https://www.youtube.com/watch?v=sposDXWEB0A',
  picURL:
      'https://i.ytimg.com/vi/sposDXWEB0A/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCadRnSpQdJeRgN7LyMVIfuqNnKgA',
);

ex.Exercise pistolSquat = ex.Exercise(
  name: 'Pistol Squat',
  focus: [ex.Focus.Legs],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=PZlLHZ4Venw',
  picURL:
      'https://i.ytimg.com/vi/PZlLHZ4Venw/hqdefault.jpg?sqp=-oaymwEjCOADEI4CSFryq4qpAxUIARUAAAAAGAElAADIQj0AgKJDeAE=&rs=AOn4CLDYz18iyuRO2XqzPR9kDT8R-UCtdQ',
);

ex.Exercise pullup = ex.Exercise(
    name: 'Pull Ups',
    focus: [ex.Focus.Back],
    difficulty: FitnessLevel.Advanced,
    equipmentNeeded: Equipment.noEquip,
    vidURL: 'https://www.youtube.com/watch?v=XeErfmGSwfE',
    picURL:
        'https://i.ytimg.com/vi/XeErfmGSwfE/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLBCzS_w8uERxMwnxvt0YCOYHjah5w');

ex.Exercise handstandPushUp = ex.Exercise(
  name: 'Handstand Pushup',
  focus: [ex.Focus.Shoulder],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=FaRge9WFzWg',
  picURL:
      'https://wodstarmedia.s3.amazonaws.com/wp-content/uploads/2015/05/hspu-zapoli.jpg',
);

ex.Exercise bicepCurl = ex.Exercise(
  name: 'Bicep Curl',
  focus: [ex.Focus.Bicep],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=in7PaeYlhrM',
  picURL:
      'https://i.ytimg.com/vi/in7PaeYlhrM/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLD8jpJiJQFJmFGhQT6MgWDuYKZGJg',
);

//cardio

ex.Exercise burpees = ex.Exercise(
  name: 'Burpees',
  focus: [ex.Focus.Cardio],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  vidURL:
      'https://www.youtube.com/watch?v=TU8QYVW0gDU&ab_channel=CrossFit%C2%AE',
  picURL:
      'https://post.healthline.com/wp-content/uploads/2019/09/Athletes-doing-burpee-exercise-in-crossfit-gym-732x549-thumbnail.jpg',
);

//abs
ex.Exercise lSit = ex.Exercise(
  name: 'L-Sit',
  focus: [ex.Focus.Abs],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  vidURL:
      'https://www.youtube.com/watch?v=IUZJoSP66HI&ab_channel=AntranikDotOrg',
  picURL: 'https://cdn.gmb.io/wp-content/uploads/2017/09/Ryan-Lsit.jpg',
);

ex.Exercise bicycle = ex.Exercise(
  name: 'Bicycle Crunches',
  difficulty: FitnessLevel.Advanced,
  focus: [ex.Focus.Abs],
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=9FGilxCbdz8',
  picURL:
      'https://i.ytimg.com/vi/9FGilxCbdz8/hq720.jpg?sqp=-oaymwEXCNAFEJQDSFryq4qpAwkIARUAAIhCGAE=&rs=AOn4CLCdBxIRysqn73QqVE_XGrNFDmjJWA',
);

ex.Exercise sidePlank = ex.Exercise(
  name: 'L-Sit',
  focus: [ex.Focus.Abs],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.noEquip,
  vidURL: 'https://www.youtube.com/watch?v=NXr4Fw8q60o&ab_channel=Howcast',
  picURL:
      'data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAoHCBYVFRUVFRUYFhUVHBocGRwaGhocGhocGhgZGRoaGhkcIy4lHB4rIRgcJjgnKy8xNTU1GiQ7QDs0Py40NTQBDAwMEA8QHxISHjQsJSw2NDQ3NDQ0NDQ0NDQ9NDQ0NDQ/NDQ0NDQ0NDQ0NDQ0NDQ0PTQ0NDQ0NDQ0NDQ0NDQ0Mf/AABEIAKgBLAMBIgACEQEDEQH/xAAcAAEAAgMBAQEAAAAAAAAAAAAABQYDBAcCAQj/xABAEAACAQIEAwUGAwUGBwEAAAABAgADEQQFEiExQVEGImGBkQcTMnGhsULB0RRSkuHwM2KCotLxFyMkY3OTwhX/xAAaAQEAAwEBAQAAAAAAAAAAAAAAAQIDBAUG/8QAJxEBAQEAAQQCAQQCAwAAAAAAAAECEQMSITEEUUETFCIyYaFxgZH/2gAMAwEAAhEDEQA/AOzREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQPkTDXxCrxM+06wbgZHMTxeOWaIiSgiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgfJir1ggJMyyrZ9mN2KA91ePjK61xF8Z7qxY3MNRJihjGA2PGVx8UWawF78Lc/LrJdcHUpspqDSCLqP18fCc38vbr4zPCx4HM72V/X9ZKgyrpvPeI7RU8MFFQk6z3QOPifATfpXW7Myc1zdbOczu9LPEjsBnFGsBocEnlfe/T5yRmtll4sYyyzmPsREhJERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAREQI/NsWEQ9TwnO81qatluzsbAC9ySbcOctGfVdb2HBP6M+dn8nDVP2hhsu1MdTwLeXAecxv8q6c/wzyydmOznuQKlXepyXiE8+bePKWLEYdXUqwuPt4iZomskk4c91beVWx+GahdjugudXQDffpORZxmjV6rVGv3jZR+6o+Een1vP0DXoq6srAFWBDA8CCLETkfbLsO1BhVotqos1tJ+JCQTx5rtx4zs+BcZ3efd9Ob5vdvM+p7ReR569C1t15j+c6j2e7S064C3IboTc+s43Sw54c/lNrDisjjQHBJH7y332F9uJnpdf4+epPPt5nR+RrF4nmO+g3n2VXsdmDOrBma+1lbihHxKDxI4Hfx3ta1qni7xcaua9jG5rPMInipUCgliABxJNgPOQWeZ+KQVKK+9r1BdVXey/vNbgOko0ktT+oT7OdHB4sgu+JZXbcqBt4Dylfy7t7XwtcU8RepSBZSeag2Nz13Hox47Ss1KtcWOzRNbBYpKqLURgyOAVI6GbMsoREQEREBERAREQEREBERAREQEREBERARErPaLtbSwt0A97VAuVDAaRy1HexPS3ptAss1sZV0rtxO0pmU+07DVDprK2HPInvqfNRqB+a28ZO5hmS1FQUXRw4Dg6rAoCCSv72x4DqOHGRfEWzOaj8UvHxlqogBVC/CALW6W2lRx9bQlSq9wgOpT1AB1eO1ptU+0lKlh6NTd0qfCQRtcm4a+4IPd+cr0s23iT2069kzzz6WmY6lRVBLEADiSbD1lJxHbZn7tJQpPMnUfTYDzvIfM80YKGdizX/Eb+QHATux8PqW/y8PP38vEnM8rhmHaimu1Maz14L/OUjtF2iL7M2o9Pwg9LfOVrFZmzHiduE0KtYsd56PS+Ljp+fy8/qfK31PE9MyYoh9XO8t2S5qlTuPvf18v65SkhwOHHrM+BxWhwx4c5tvPdGWL2Xw67hVCstUfENjYX1Dy4HeWinUBFwbgzmlHPvd0yeI3APQlWt/mCj/FPGWdpGqpWCtpChLgbHvL3t+moGeT8np2S6v4et8fc1qZn5XLPscpARWuQe8B9LmV7H1CqO6LdyLkcC9hwJ+Ww6SNwuIJJsR5w+blbFu8B8QUXJFvw29fGxFp5etW16uM8Z4Zuz2MdwyuG0bMhY3YXvqpsb7lTwPAgiVr2hZRdfeou2+qwvueZ/rlJDOsZVBR6bhEYhU7moXJPec8lNh6zffNkbDa63d1KyshtfUvdZfHfnInPPKdSccPHsYzN2pPQYqEpnu95tfDgFta3jx38Bbqs517KMrKUXrsGU1GuLhbFPwkHjz34cJ0WdEcevb7ERJQREQEREBERAREQEREBERARE5v7QO2GJwbCmFRBUvoZe+xAtcm4spueG/EbwOg4nEpTUu7BVHEk2Ep2be0OhTJWkpqEfiJ0rfwBFz6CcazTtNiMQb1KjuOQZiQPkL2EinxRbnLcDoebdvsQ4Y+8KgmwVBpUXHXifMym4jOHc/ESWIuTxNzv5yIqVza19r38+Exl91I8DBwzV6h6mWDIc/CV8O+Jd2p4dWWmANWi6aQFHT15Ssu14Zx8zaLOYtnVjoWXZ4rYHEXqKa+JxFRmS41qr+7Ubcl0qd5iXGVPde7D2pk6ivIsLb78OA4WlPyarZiOoH0P85YEqbT1fg9PM6fN8+eXk/O6m7vx48cf8t7CYvQwJnzN8y94QBwE0WMwMJ3X3y4c+uGXUJ4eeRPpkLccAnsTGJkEFb2IzAmiKfMkaj4Lw/WfOzuJ0VihNlqro34auK/p/imnaeUw5JBHL6dD6zHrdObxc/bf4/VuNy/Sfw2YPRd6bLq6eI5EddvtN2gAzq41C3Ic97/AH+5lo7K5BTxFNa1UHY6StrXItffja8uOHyuiltNJARwNgT6nefO3p8Xi+30H6048enP3ZdPftc3snMkC/l85JZb2GSqRWxh13F0pLqVKYO9idmZt+O29+O0uX7FT1a9C6+ukX/3m1aTnHCu+r3Twx0KKoqqqhVUAADgAOAEyxEuyIiICIiAiIgIiICInyAiY/fDrMdbFKouSAOpkcxPFbE8NVA4mQ+IztLd27E+X9CRNbOCxtsPCVu5Guejb7SuYZtuVXgOJnO/abhjVw3vRu1Bgx66Ts3pe8sVbFLx5+Eh81xSMjo5GhwVI6gixmfdeeW36cmeHFjUnk1LTxWUqzLe5UkX+RteYx9TOnlyMisSbTM08IthF77yUPTjaKR4z6pnhTAz4B7Ovjt6yyUWlTJ3vw5iWHC1rqG6iej8Hfi5/wC3B8zHPGm+xmMtPBeYXed904M5bBaeS81hV6meGrynfGk6dbeuZVaRq1j0MyLXtxBibhrpVKCb2EIkPQxAMkcO8t7jHi5vl3fIqQXD0lHAKPPxvJGVL2f5otTDrSLXelcEWPwk93fhzt5S2Twerm53Zft7nS1NYlj1ERM2hERAREQEREBERA+RNLGZklPYm7dBx8+krWY9oSbjVpHQSutSL5xdLLi8xROdz0Eh8Vm7G+4UfWVDEZ6ORkbWxdR/hDETK6tb56ci3Vs4UDd/raQWMzpSd2kPQwteqwVULMeQ3PzPQSwL7Pa7qC1VVJ5bm3mNozLVrrOfaGxOeqpFjcDp+cjxnjuxKrty3A+8uFD2ZC/fr+Sp+ZMsGA7F4Oj3imsjnUNx/CLL6iT2WovWzHNsO+JqnSlNmJ6b/ab1bsbjXQuy2sCdNxqNuQHEnwnSHzihSGlBe3JFAH5CR+Kz2o4si6B14n15SeMz8o7969R+dc8wDpULNTemrfDrRl1WFiRfjv0kaKR6y+e05/8An0lJuVQsfm7Ef/EpZ+02z5jn1ONVjCafMT4on12uZ8llQGxn1jaeGnkGB6O+8lMqr90qeW4+R/n95FqZM5BkGJxFTTh6TPvuwFlA2vqY90cRtx8Jp0d9m5WfVx3ZsbZqiYWJPAXl2yz2ZYx/7ULT+bg+umX7IewGHoWZwKrjfvDu+h4+c7t/KzJ7/wDHHnoa59OKUMnrPwQ26mSNLsw5438hefoWlhUX4UVfkoH2ma0578z/AB/tt+3v2/Pq9nXGyo5/wN+kyN2UxDDajU/gb9J3+0+WkfvL9H7afb8zY3LKlAnUpFuIII+88YfG32nR/a5hbvTYAfDvvY7MeY35zlq07G9j9v8Aed3S3dZmvty76c5svuO2eyw3o1Ty1KB8wCT9xL5KL7Jz/wBI3H4yfoP0l6nl/IvPVru6E46cj7ERMWxERA1sfihSps7cFtfzIH5zHWx6IrOzBVXiW2HL9Zp9rVvgsTva1Nz/AAjV+U5jlme1KmBxFKsSSjI1JiLFlDDWDbiAOfzj8p/DraY9CNQaw8QfDb57j1E0v/3EOrT3tNrsoYrwvYbXJ4bC/wAS9ZRWzHVhsI6uHCPTSojckuUYH5FQ4PIKOXHNkWZo1Cmjrd0V1ZmcFqnun0F+F9PdHevz84pIvS5vTIuD8x0NgbfUSFzbtHYEKdI+v8pWcLi/fOEoMXd2YW4EFdSuN/wjSN/7ssmE7Fqe9Xcuei7KPM7mYy6rezGL75U/HZyzE6ZqU6VWrwR38FVj9p1bC5Fh6fw0kuOZFz9Zvl1UcQAJPZ9ovW+o5dg+zeKb4KGnxcqD6HeT2B7G1GIOIrbfup/qI29JZq+aqvAFjImpmtQ3Oq3gBF7YS71/hOYHA06K6aaBRztxPiSdz5z3icWlMXdgv3PyErTZrVtsx+e0isViPxM1yepuY/U+idG2+asWJ7QDgi7dT+khsyzV324IPUnqZBviyAbcPCRWJ7RIFO5uNiJW3VbZxnKwftaLz3hMwHKUV88ZzqWmdAO5P5SSpZ4pFgjX8FJ+0jird0Vr2iYjVjL/APbS3kWlTqPfaWftwju1OsaTottGpkZQTuyi5G5+L0lSnRj04t/2rIrbTyXnmNMuqBp9DTPhMHUqsEpo1RjwVFLN/CN5cuz/ALLcdiCDUT9mp82q/Fb+7THeJ+ekeMgVHC0mchVUszFQoUEksTZQB1JNp+new2SnB4KhQa2tQWexv33JZhfna9r+E1+ynYnC4AKaaB61rNVcXc9dPJB4L534y0yLQiIkBERAREQK32uytK6DWoa1wOu/IEbznKdlaBPdZ08Lhh9Rf6zr2YUtS/Ig/r95RMQoWqw8ZF63Ux/W2L46WN/2kqy9j8qGHolQ2oMb8LchLDIbs/iNS26SZk913/K+1dZmLxPT7ERCCIiBq5hhxUpVKZvpdGU242ZSDbx3nE8qVHDUDi0Rao0IppsrByukAux0jpzndROJ+0LIFoYxCgK0sQdVye7r1XZAR8O5Hk+3CRYmfSJo5TiA1TDMyK6G1RWBYEutgVANipXxva95my/KqjVCKldi5RdQHcbvqCnwkqydwqOIuvDvTbfOn/aUxYRbOBSqKt+4SwUOQdw4OxPLbrvhwddUq69VjZkW+52qVKiAAbkKtRVtzIWErZ2dFPBllpBSSfiZQWBtZl12DEd0G1+Zk++f1DzVfL9ZUaOS5hiQzU6Yw6kqUeoQCylTc6LFgd+Ym9S9n2Lb+0xwHXSrN/pmcmvPLW3p+OE0+dVOdQfQTWqZqTxf6zAns3PPHVCfBF/MmeW9md+OOq/wKPzjt0d+Pw8tmaA7vMT55SXmD5zJ/wALV54uo3zT9GE8D2UrffEn/wBf6uY7KfqRpV+09MX3EgcRjziH0UkZ2bYBbk+VpfMF7MsKpu7VKngSqr6KL/WWrLspoYcWo0lTxA7x+bHc+Zkzpl6v05dgfZ5jX71SoqA8mYsfRR+kn8B7MaS2Nes9S3JVVF+uo/adBiX4jK71UNguzOEpAaKCbc2Go/5ryVSmF2CgDwAH2mSJKOVe7cZH+24KvQHxldVP/wAi95d+V7aT4MZwPJfZ7j8T3kw7U0/eq/8ALHkG7x+YFp+nohDiOV+xWqbHEYlE6rTVnP8AE2mx8jLtlXsvy6gQxomsw51WLD+AWU+Yl4iTyNXC4KnSFqVNKa9EVVHoom1ESAiIgIiICIiAiIgeSJznPSUrsOk6PIXH5dTaoWYXJA2+kpucxp0tcXyhezdVtdwDpHGXIODzEp3afF/s9NAibFgNK2A3B4k7ceshsrzmzAiprZTfQi6iPAkXJHkJTN7fDXWO/wAx02Jr4OvrRHI0lgDY8rjhNibOYiIgfJVvaEMN+x1DimKqCDTK2NQVfwe7B4tflwte9hcxEJjiXZ/FOMS5ZGa99YVlUXt1dSL8+HECdH7KdpsrpuE9ycPXJsalUByTYm/veKjc8lHyuIiRE10fCYynVXVTdHXqjBh6ibMRJVIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgJA9qsUadEslzVv3ABx6hjyXx+XGIkX0nPty7tB2irvTZauGcDTa+pWBkPkWcKmlFqnDLYEk0yb8LhiLaj435REzrojtvZbHJWw6MjFlW66j+Ira5/rxkzETSenPr2+xESUP//Z',
);

ex.Exercise hangingLegRaises = ex.Exercise(
  name: 'Hanging Leg Raises',
  focus: [ex.Focus.Abs],
  difficulty: FitnessLevel.Advanced,
  equipmentNeeded: Equipment.pullUpBar,
  vidURL:
      'https://www.youtube.com/watch?v=Pr1ieGZ5atk&ab_channel=ATHLEAN-X%E2%84%A2',
  picURL: 'https://miro.medium.com/max/1838/0*Mly7U-TaaUvMxnpW',
);

List<ex.Exercise> advancedExercises = [
  pikePushup,
  bicycle,
  pistolSquat,
  pullup,
  handstandPushUp,
  bicepCurl,
  burpees,
  lSit,
  sidePlank,
  hangingLegRaises,
];

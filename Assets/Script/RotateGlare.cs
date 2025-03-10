using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using DG.Tweening;

public class RotateGlare : MonoBehaviour
{
    public Image Glare;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        Glare.rectTransform.DORotate(new Vector3(0, 0, -600f), 6f, RotateMode.FastBeyond360)
             .SetEase(Ease.Linear);
    }
}

using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class SwitchToogles : MonoBehaviour
{
    [SerializeField] RectTransform uiHandleRectTransform;
    Toggle toggle;
    Vector2 handlePosition;

    void Awake()
    {
        toggle = GetComponent<Toggle>();
        handlePosition = uiHandleRectTransform.anchoredPosition;
        toggle.onValueChanged.AddListener(OnSwitch);

        if (toggle.isOn)
        {
            OnSwitch(true);
        }
    }

    void OnSwitch(bool on)
    {
        if (on)
        {
            uiHandleRectTransform.anchoredPosition = handlePosition * -1;
            GameManager.instance.SetVibration = true;
        }
        else
        {
            uiHandleRectTransform.anchoredPosition = handlePosition;
            GameManager.instance.SetVibration = false;
        }
/*        uiHandleRectTransform.anchoredPosition = on ? handlePosition * (-1) : handlePosition;*/ // nhân x position với -1 để đảo vị trí
    }
    void OnDestroy()
    {
        toggle.onValueChanged.RemoveListener(OnSwitch);
    }
}

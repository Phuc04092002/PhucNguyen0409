using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MusicSwitchToggle : MonoBehaviour
{
    [SerializeField] RectTransform uiHandleRectTransform;
    Toggle toggle;
    Vector2 handlePosition;
    public GameObject BGMusic;
    private AudioSource audioSource;

    void Awake()
    {
        audioSource = BGMusic.GetComponent<AudioSource>();
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
            audioSource.Play();
            GameManager.instance.TapAudio.SetActive(true);
        }
        else
        {
            uiHandleRectTransform.anchoredPosition = handlePosition;
            audioSource.Pause();
            GameManager.instance.TapAudio.SetActive(false);
        }
        /*        uiHandleRectTransform.anchoredPosition = on ? handlePosition * (-1) : handlePosition;*/ // nhân x position với -1 để đảo vị trí
    }
    void OnDestroy()
    {
        toggle.onValueChanged.RemoveListener(OnSwitch);
    }
}